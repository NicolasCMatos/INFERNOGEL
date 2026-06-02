extends Control

@onready var lista_pecas: Array = $Pecas.get_children()

func _ready() -> void:
	# Garante que começa totalmente invisível e resetado na tela
	hide() 
	position = Vector2.ZERO 

func iniciar_puzzle() -> void:
	show()
	# Força o painel a se alinhar perfeitamente com a tela do jogador
	set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	configurar_quebra_cabeca()

func configurar_quebra_cabeca() -> void:
	var lista_espacos = $EspacosCorretos.get_children()
	
	for i in range(min(lista_pecas.size(), lista_espacos.size())):
		if lista_pecas[i] is TextureButton:
			# Pega a posição global correta que você desenhou no editor
			lista_pecas[i].posicao_correta = lista_espacos[i].global_position
			lista_pecas[i].ja_encaixou = false
			lista_pecas[i].disabled = false
			
	embaralhar_pecas()

func embaralhar_pecas() -> void:
	var random = RandomNumberGenerator.new()
	random.randomize()
	
	# Detecta o tamanho dinâmico da tela do seu jogo (ex: 1152x648)
	var tamanho_tela = get_viewport_rect().size
	
	for peca in lista_pecas:
		if peca is TextureButton:
			# Sorteia posições seguras espalhadas dentro da visão do jogador
			var x_aleatorio = random.randf_range(tamanho_tela.x * 0.15, tamanho_tela.x * 0.75)
			var y_aleatorio = random.randf_range(tamanho_tela.y * 0.2, tamanho_tela.y * 0.7)
			peca.global_position = Vector2(x_aleatorio, y_aleatorio)

func checar_vitoria() -> void:
	var todas_encaixadas: bool = true
	
	for peca in lista_pecas:
		if peca is TextureButton and not peca.ja_encaixou:
			todas_encaixadas = false
			break
			
	if todas_encaixadas:
		print("PARABÉNS! Você resolveu o quebra-cabeça!")
		puzzle_resolvido()

func puzzle_resolvido() -> void:
	await get_tree().create_timer(1.5).timeout 
	fechar_puzzle()

func fechar_puzzle() -> void:
	hide()
