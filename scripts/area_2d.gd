extends Area2D

@export var gamemanager: Node
@onready var itemsom: AudioStreamPlayer2D = $"../../itemsom"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		gamemanager.add_peça()
		itemsom.play()
		queue_free()
