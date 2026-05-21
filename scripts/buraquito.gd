extends Area2D

func _ready():
	body_entered.connect(_ao_entrar_no_buraco)


func _ao_entrar_no_buraco(corpo: Node2D):

	if corpo.is_in_group("player"):

		executar_sequencia_de_queda(corpo)


func executar_sequencia_de_queda(jogador: Node2D):

	jogador.set_physics_process(false)

	var animacao = create_tween()

	# puxa para o centro do buraco
	animacao.parallel().tween_property(
		jogador,
		"global_position",
		global_position,
		0.4
	)

	# encolhe
	animacao.parallel().tween_property(
		jogador,
		"scale",
		Vector2.ZERO,
		0.4
	)

	# desaparece
	animacao.parallel().tween_property(
		jogador,
		"modulate:a",
		0.0,
		0.4
	)

	await animacao.finished

	# respawn
	jogador.spawn_player()

	# restaura visual
	jogador.scale = Vector2.ONE
	jogador.modulate.a = 1.0

	jogador.set_physics_process(true)
