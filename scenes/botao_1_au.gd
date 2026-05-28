extends Area2D

@onready var music_manager: Node = get_tree().current_scene.find_child("MusicManager", true,false)
var occupied: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	print('o botão detectou algo:',body.name)
	if body.is_in_group("player") or body.name == "Player":
		occupied = true
	if music_manager:
		print("musicmanager encontrado!alterando volume...")
		music_manager.music_weights["audio1"]=0.0
		music_manager.fade_to_weights(0.5)
	else:
		print("erro! o botão não achou o nó")
		


		if music_manager:
			music_manager.music_weights["audio1"] = 0.0
			music_manager.fade_to_weights(0.5)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player") or body.name == "Player":
		occupied = false
		if music_manager:
			music_manager.music_weights["audio1"] = -80.0
			music_manager.fade_to_weights(0.5)
