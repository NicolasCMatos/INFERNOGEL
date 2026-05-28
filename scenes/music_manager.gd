extends Node

# Referências para os nós de áudio 2D
# Certifique-se de que os nomes na árvore de nós sejam exatamente Track1 e Track2
@onready var audio1: AudioStreamPlayer2D = $audio1
@onready var audio2: AudioStreamPlayer2D = $audio2


# Dicionário de pesos. Começa em -80.0 para o jogo iniciar em silêncio
var music_weights = {
	"audio1": -80.0,
	"audio2": -80.0
}

func _ready() -> void:
	# Inicializa os players tocando em segundo plano
	if audio1 and audio2:
		audio1.play()
		audio2.play()
		_apply_volumes()

# Faz a transição suave dos volumes usando Tween
func fade_to_weights(duration: float = 0.5) -> void:
	var tween = create_tween().set_parallel(true)
	tween.tween_property(audio1, "volume_db", music_weights["audio1"], duration)
	tween.tween_property(audio2, "volume_db", music_weights["audio2"], duration)

# Aplica os volumes do dicionário instantaneamente
func _apply_volumes() -> void:
	audio1.volume_db = music_weights["audio1"]
	audio2.volume_db = music_weights["audio2"]
