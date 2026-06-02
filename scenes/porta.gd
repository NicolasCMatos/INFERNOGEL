extends Area2D

@export var item_necessario: String = "chavedeprata"
var jogador_na_area: Node2D = null

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Jogador" or body.is_in_group("player"):
		jogador_na_area = body

func _on_body_exited(body: Node2D) -> void:
	if body == jogador_na_area:
		jogador_na_area = null

func _unhandled_input(event: InputEvent) -> void:
	if jogador_na_area != null and event.is_action_pressed("interagir"):
		if item_necessario in jogador_na_area.inventario:
			print("Você usou a chave e abriu a porta!")
			jogador_na_area = null
			queue_free()
		else:
			print("Você tenta abrir, mas está trancada e você não tem a chave.")
func abrir_porta() -> void:
		print('a porta abriu')
		queue_free()
