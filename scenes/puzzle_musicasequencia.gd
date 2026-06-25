extends Node2D
@export var cena_da_chave: PackedScene
@export var id_da_chave_do_puzzle: String = "chave_roxa"
@export var chave_no_cenario: Area2D
signal puzzle_resolvido
# A sequência correta que o jogador deve acertar (ex: Botão 2, depois 1, depois 3)
const SEQUENCIA_CORRETA: Array[int] = [1,2,5,3,4]

# Lista que vai guardar a ordem que o jogador está a pisar
var sequencia_do_jogador: Array[int] = []

@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer
@onready var audio_erro: AudioStreamPlayer2D = $AudioErroPlayer

func _ready() -> void:
	print("--- Puzzle de Sequência Iniciado! ---")
	print("A ordem correta é: ", SEQUENCIA_CORRETA)

# Esta função será chamada por cada botão individualmente
func registrar_clique(id_do_botao: int) -> void:
	if sequencia_do_jogador.size() >= SEQUENCIA_CORRETA.size():
		return
	sequencia_do_jogador.append(id_do_botao)
	print("Jogador pisou no botão: ", id_do_botao, " | Sequência atual: ", sequencia_do_jogador)
	var indice_atual = sequencia_do_jogador.size() -1

	if sequencia_do_jogador[indice_atual] != SEQUENCIA_CORRETA[indice_atual]:
		print("❌ Errou a sequência! Resetando...")
		errar_puzzle()
		return

	# Se chegou aqui, o passo atual está correto. Agora verifica se completou tudo
	if sequencia_do_jogador.size() == SEQUENCIA_CORRETA.size():
		print("🏆 PARABÉNS! Sequência correta! Puzzle resolvido!")
		vencer_puzzle()

func errar_puzzle() -> void:
	sequencia_do_jogador.clear()
	if audio_erro and not audio_erro.playing:
		audio_erro.play()


func vencer_puzzle() -> void:
	if cena_da_chave:
		var nova_chave = cena_da_chave.instantiate()
		if "key_id" in nova_chave:
			nova_chave.key_id = id_da_chave_do_puzzle
		get_parent().add_child(nova_chave)
		nova_chave.global_position = global_position
	if chave_no_cenario:
		chave_no_cenario.visible = true
		chave_no_cenario.set_deferred("monitoring",true)
		chave_no_cenario.set_deferred("monitorable",true)
	if audio_player and not audio_player.playing:
		audio_player.play() # Toca a música de vitória!
		
	puzzle_resolvido.emit()
