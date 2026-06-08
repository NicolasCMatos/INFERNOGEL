extends CanvasLayer
@onready var botao: AudioStreamPlayer = $botao

func _ready() -> void:
	visible = false
	get_tree().paused = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			visible = false
			get_tree().paused = false
		else:
			visible = true
			get_tree().paused = true

func _on_voltar_pressed() -> void:
	botao.play()
	await get_tree().create_timer(0.1).timeout
	visible = false
	get_tree().paused = false


func _on_sair_pressed() -> void:
	botao.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
