extends CanvasLayer

@onready var label_texto: RichTextLabel = $PainelFundo/Texto
@onready var timer: Timer = $TimerExibicao

var mensagem_completa: String = ""

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	

	hide()
	
	exibir_mensagem("Olá, aventureiro! Bem-vindo ao mundo de Godot. Pressione 'E' para continuar.")


func exibir_mensagem(texto_para_mostrar: String) -> void:
	mensagem_completa = texto_para_mostrar
	label_texto.text = "" 
	show() 
	
	label_texto.visible_characters = 0
	timer.start()

func _on_timer_timeout() -> void:
	if label_texto.visible_characters < mensagem_completa.length():
		label_texto.visible_characters += 1
	else:
		timer.stop() 


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interagir") and visible:
		if label_texto.visible_characters >= mensagem_completa.length():
			hide()
		else:
			label_texto.visible_characters = mensagem_completa.length()
			timer.stop()
