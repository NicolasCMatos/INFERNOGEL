extends Area2D

# Caso o grupo não seja encontrado, ele usará este valor padrão
@export var posicao_reserva: Vector2 = Vector2(1226, 467)
@export var destino: Vector2 = Vector2 (1240, 492)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.global_position = destino

func _ready():
	if not body_entered.is_connected(_ao_entrar_no_buraco):
		body_entered.connect(_ao_entrar_no_buraco)

func _ao_entrar_no_buraco(corpo: Node2D):
	if corpo.is_in_group("player"):
		executar_sequencia_de_queda(corpo)

func executar_sequencia_de_queda(jogador: Node2D):
	jogador.set_physics_process(false)
	

	var animacao = create_tween()
	animacao.parallel().tween_property(jogador, "global_position", global_position, 0.4)
	animacao.parallel().tween_property(jogador, "scale", Vector2.ZERO, 0.4)
	animacao.parallel().tween_property(jogador, "modulate:a", 0.0, 0.4)
	animacao.finished.connect(func(): resetar_posicao_jogador(jogador))
	
#tudo errado aqui no checkpoint, se conseguir resolver agradeço
func resetar_posicao_jogador(jogador: Node2D):
	var checkpoint = get_tree().get_first_node_in_group("destino")
	if checkpoint:
		jogador.global_position = checkpoint.global_position
		jogador.scale = Vector2.ONE 
		jogador.modulate.a = 1.0
		jogador.set_physics_process(true)
