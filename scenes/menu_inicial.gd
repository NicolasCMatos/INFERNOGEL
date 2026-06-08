extends Control

@onready var botao: AudioStreamPlayer = $botao



func _on_iniciar_pressed() -> void:
	botao.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/historinha_do_inicio.tscn")


func _on_opções_pressed() -> void:
	botao.play()
	await get_tree().create_timer(0.3).timeout
	pass # Replace with function body.


func _on_sair_pressed() -> void:
	botao.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
