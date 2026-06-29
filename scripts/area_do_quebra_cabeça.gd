extends Area2D

# Usamos diretamente o caminho que você definiw. 
# Garanta que o nome do nó no CanvasLayer está com a mesma acentuação (QuebraCabeça)
@onready var puzzle_ui: Control =$"../QuebraCabeça/QuebraCabeça"
@export var gamemanager: Node
@export var pecas_necessarias: int = 9 #quantidade de peças para liberar o botão
@onready var vazio: Sprite2D = $vazio
signal puzzle_resolvido
@onready var qbsom: AudioStreamPlayer2D = $"../qbsom"

func _ready() -> void:
	if gamemanager:
		gamemanager.pecas_atualizadas.connect(_on_pecas_atualizadas)
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.is_in_group("player"):
		print("Jogador entrou na área do puzzle!")
		if puzzle_ui:
			puzzle_ui.iniciar_puzzle()
		else:
			print("ERRO: Não encontrei o nó QuebraCabeça no caminho '../CanvasLayer/QuebraCabeça'")

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player" or body.is_in_group("player"):
		print("Jogador saiu da área do puzzle!")
		if puzzle_ui and puzzle_ui.visible:
			puzzle_ui.fechar_puzzle()
			
func _on_pecas_atualizadas(quantidade_atual: int):
	if quantidade_atual >= pecas_necessarias:
		qbsom.play()
		vazio.visible = false
		monitoring = true
		print('ativadooooo')
	else:
		print('não tem todas as peças')
