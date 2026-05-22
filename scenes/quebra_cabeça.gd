extends Control

@onready var lista_pecas: Array = $Pecas.get_children()

func _ready() -> void:
	configurar_quebra_cabeca()

func configurar_quebra_cabeca() -> void:
	$Pecas/Peca1.posicao_correta = $EspacosCorretos/Posicao1.global_position
	$Pecas/Peca2.posicao_correta = $EspacosCorretos/Posicao2.global_position
	embaralhar_pecas()

func embaralhar_pecas() -> void:
	var random = RandomNumberGenerator.new()
	random.randomize()
	
	for peca in lista_pecas:
		if peca is TextureButton:
			peca.global_position = Vector2(random.randf_range(100, 400), random.randf_range(300, 500))

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
	# Aqui você coloca o que acontece quando ele ganha
	# Ex: Abre uma porta, toca uma música, libera a passagem, etc.
	pass
