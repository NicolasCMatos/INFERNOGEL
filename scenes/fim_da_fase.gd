extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		call_deferred("load_next_scene")

func load_next_scene():
	get_tree().change_scene_to_file("res://scenes/tela_de_fim.tscn")
