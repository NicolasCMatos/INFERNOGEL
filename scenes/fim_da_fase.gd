extends Area2D

func _ready():
	print("Area carregada")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("entrou")
		print("Detectou:", body.name)
		Transiçaodefase.change_scene_to("res://scenes/cena_final.tscn")
