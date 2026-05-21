extends Area2D

@export var spawn_marker: Marker2D




func _on_body_entered(body: Node2D) -> void:

	if body.is_in_group("player"):

		print("entrou")

		if body.has_method("set_checkpoint"):

			body.set_checkpoint(spawn_marker.global_position)
