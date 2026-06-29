extends Control

func _ready() -> void:
	await get_tree().create_timer(10).timeout
	get_tree().quit()
