extends Area2D

func _ready():
	print("Area carregada")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("entrou")
		print("Detectou:", body.name)
		get_tree().change_scene_to_file("res://scenes/cena_final.tscn")
