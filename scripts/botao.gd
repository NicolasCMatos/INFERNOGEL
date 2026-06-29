extends Area2D

var occupied:bool = false
@onready var buracosom: AudioStreamPlayer2D = $"../buracosom"

@onready var buracos: Node2D = $"../Buracos"




#ao pisar
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		buracosom.play()
		occupied = true
		buracos.visible = true
		print(buracos)

#ao sair
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		buracosom.play()
		occupied = false
		buracos.visible = false
