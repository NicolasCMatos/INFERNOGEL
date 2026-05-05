extends StaticBody2D
@export var required_item_id: String = "chave_bronze"
var is_open: bool = false
func interact(character):
	if is_open:
		return
	if character.has_method("has_item") and character.has_item(required_item_id):
		abrir_porta(character)
	else:
		print("Trancado! Você precisa da: ", required_item_id)
func abrir_porta(character):
	is_open = true
	print("A porta se abriu!")
	character.remove_item(required_item_id)

	$CollisionShape2D.disabled = true
	visible = false


func _on_interactiondetector_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
