extends Node2D

@export var required_key = "chave_amarela"
@onready var portasom: AudioStreamPlayer = $portasom

var player_near = null
var opened = false


func _process(delta):

	if opened:
		return

	if player_near and Input.is_action_just_pressed("interagir"):

		if required_key in player_near.keys:
			print("Abrindo porta")
			portasom.play()
			open_door()
		else:
			print("A porta requer a chave ", required_key)

func open_door():
	var collision = $StaticBody2D/CollisionShape2D

	if collision:
		collision.set_deferred("disabled", true)
		visible = false
		print("Porta aberta!")
	else:
		print("CollisionShape2D não encontrado!")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_near = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player_near:
		player_near = null
