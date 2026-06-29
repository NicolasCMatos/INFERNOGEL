extends Control

@onready var botoesprincipais: VBoxContainer = $botoesprincipais
@onready var botao: AudioStreamPlayer = $botao
@onready var opcoes: Panel = $opcoes

func _ready() -> void:
	botoesprincipais.visible = true
	opcoes.visible = false

func _on_iniciar_pressed() -> void:
	botao.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/historinha_do_inicio.tscn")


func _on_opções_pressed() -> void:
	botao.play()
	await get_tree().create_timer(0.3).timeout
	botoesprincipais.visible = false
	opcoes.visible = true
	
	pass # Replace with function body.


func _on_sair_pressed() -> void:
	botao.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()


func _on_voltar_pressed() -> void:
	botao.play()
	await get_tree().create_timer(0.3).timeout
	_ready()
