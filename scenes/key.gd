extends Area2D
@export var item_id: String = "chave_bronze"

func interact(character):
	if character.has_method("add_item_to_inventory"):
		character.add_item_to_inventory(item_id)
		# Aqui pode tocar um som ou efeito de partículas antes de deletar
		queue_free()
