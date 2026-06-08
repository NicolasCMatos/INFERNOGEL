extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.timeline_ended.connect(_on_timeline_ended)

	Dialogic.start("inicio")

func _on_timeline_ended():
	print("Fim do diálogo")
	get_tree().change_scene_to_file("res://scenes/jogo.tscn")
