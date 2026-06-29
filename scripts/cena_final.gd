extends Control

func _ready():
	Dialogic.timeline_ended.connect(_on_timeline_ended)

	Dialogic.start("final")

func _on_timeline_ended():
	print("Fim do diálogo")
	Transiçaodefase.change_scene_to("res://tela de creditos.tscn")
