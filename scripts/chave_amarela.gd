extends Area2D

@onready var itemsom: AudioStreamPlayer2D = $"../itemsom"

@export var key_id = "chave_amarela"

func _on_body_entered(body):
	if not visible:
		return
	if body.is_in_group("player"):
		if key_id not in body.keys:
			body.keys.append(key_id)

		print("Pegou a chave:", key_id)
		itemsom.play()
		queue_free()
