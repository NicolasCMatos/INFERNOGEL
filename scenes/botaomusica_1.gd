extends Area2D

# Esta variável vai aparecer no Inspector à direita. 
# Cada botão terá o seu próprio número!
@export var botao_id: int = 1
@export var som_do_botao:AudioStream
@export_range(0,100) var volume_do_som: float = 100
# Referência para o Gerenciador (o nó pai)
@onready var manager = $".."
var clique_valido = false
func _ready():
	if som_do_botao:
		som_do_botao = som_do_botao.duplicate()
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("arquivo de som existe?", som_do_botao !=null)
		if som_do_botao:
			var som_temporario = AudioStreamPlayer.new()
			som_temporario.stream = som_do_botao
			add_child(som_temporario)
			som_temporario.play()
			som_temporario.finished.connect(som_temporario.queue_free)
			
			print("comando executado")
		else:
			print("erro")
		# Avisa o gerenciador qual foi o botão pisado
		if manager and manager.has_method("registrar_clique"):
			clique_valido = manager.registrar_clique(botao_id)
		if clique_valido and som_do_botao:
			var som_temporario = AudioStreamPlayer.new()
			som_temporario.stream = som_do_botao
			add_child(som_temporario)
			som_temporario.play()
			som_temporario.finished.connect(som_temporario.queue_free)
