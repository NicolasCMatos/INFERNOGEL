extends TextureButton

@export var posicao_correta: Vector2
@export var target_maker: Marker2D
@export var distance_threshold: float = 0.50


var arrastando: bool = false
var offset_mouse: Vector2

var distancia_encaixe: float = 100.0
var ja_encaixou: bool = false

func check_snap() -> void:
	if not target_maker:
		return
	var meu_centro = global_position + (size/2)
	var distancia = meu_centro.distance_to(target_maker.global_position)
	if distancia <= distance_threshold:
		global_position = target_maker.global_position - (size/2)
		verificar_encaixe()

func _ready() -> void:
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)

func _process(_delta: float) -> void:
	if arrastando and not ja_encaixou:
		# Garante que ele segue o mouse na coordenada global da tela
		global_position = get_global_mouse_position() - offset_mouse

func _on_button_down() -> void:
	if not ja_encaixou:
		arrastando = true
		offset_mouse = get_global_mouse_position() - global_position
		move_to_front()

func _on_button_up() -> void:
	if arrastando:
		arrastando = false
		# PRINT DE TESTE: Mostra a distância atual até o objetivo
		print(name, " soltada. Distância até o encaixe: ", global_position.distance_to(posicao_correta))
		verificar_encaixe()

func verificar_encaixe() -> void:
	if global_position.distance_to(posicao_correta) < distancia_encaixe:
		global_position = posicao_correta
		ja_encaixou = true
		disabled = true 
		print(name, " encaixada perfeitamente!")
		
		# Procura o nó principal do puzzle subindo na árvore de nós
		var pai = get_parent()
		while pai and not pai.has_method("checar_vitoria"):
			pai = pai.get_parent()
			
		if pai:
			pai.checar_vitoria()
		else:
			print("ERRO: Não encontrei o script principal do Quebra-Cabeça acima desta peça!")
