extends TextureButton

@export var posicao_correta: Vector2

var arrastando: bool = false
var offset_mouse: Vector2 = Vector2.ZERO

var distancia_encaixe: float = 30.0
var ja_encaixou: bool = false

func _ready() -> void:
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)

func _process(_delta: float) -> void:
	if arrastando and not ja_encaixou:
		global_position = get_global_mouse_position() - offset_mouse

func _on_button_down() -> void:
	if not ja_encaixou:
		arrastando = true
		offset_mouse = get_global_mouse_position() - global_position
		move_to_front()

func _on_button_up() -> void:
	if arrastando:
		arrastando = false
		verificar_encaixe()

func verificar_encaixe() -> void:
	if global_position.distance_to(posicao_correta) < distancia_encaixe:
		global_position = posicao_correta
		ja_encaixou = true
		disabled = true 
		print(name, " encaixada perfeitamente!")
		get_parent().get_parent().checar_vitoria()
