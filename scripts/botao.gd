extends Area2D

var occupied:bool = false

@onready var buracos: Node2D = $"../Buracos"




#ao pisar
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		occupied = true
		buracos.visible = true
		print(buracos)

#ao sair
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		occupied = false
		buracos.visible = false
