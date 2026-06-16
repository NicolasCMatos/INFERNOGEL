extends Area2D


@export var key_id = "chave_amarela"

func _on_body_entered(body):
	if not visible:
		return
	if body.is_in_group("player"):
		if key_id not in body.keys:
			body.keys.append(key_id)

		print("Pegou a chave:", key_id)
		queue_free()
