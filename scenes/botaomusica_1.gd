extends Area2D

# Esta variável vai aparecer no Inspector à direita. 
# Cada botão terá o seu próprio número!
@export var botao_id: int = 1

# Referência para o Gerenciador (o nó pai)
@onready var manager = $".."

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		# Avisa o gerenciador qual foi o botão pisado
		if manager and manager.has_method("registrar_clique"):
			manager.registrar_clique(botao_id)
