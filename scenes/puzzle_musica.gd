extends Node2D

# Referências diretas e seguras para os nós filhos usando caminhos relativos ($)
@onready var detector: Area2D = $AreaDetector
@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer

func _ready() -> void:
	# Segurança: garante que a música comece desligada
	if audio_player and audio_player.playing:
		audio_player.stop()
	print("--- Puzzle de Música Iniciado Prontinho no Mapa! ---")

# Função que será chamada quando o jogador entrar na área
func _on_area_detector_body_entered(body: Node2D) -> void:
	# Imprime no console quem entrou para podermos testar a física
	print("Objeto detectado pelo puzzle: ", body.name)
	
	# Verifica se o objeto faz parte do grupo "player"
	if body.is_in_group("player"):
		print("-> O jogador entrou na área! Ligando a música...")
		
		if audio_player and not audio_player.playing:
			audio_player.play()

# Função opcional: Desliga a música quando o jogador se afastar
func _on_area_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("-> O jogador saiu da área. Desligando a música.")
		
		if audio_player and audio_player.playing:
			audio_player.stop()
