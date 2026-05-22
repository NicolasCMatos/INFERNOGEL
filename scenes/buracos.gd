extends Area2D

@export var local_de_retorno: Node2D

func _on_body_entered(body):
	print("Algo caiu no buraco: ", body.name)
	


func _on_personagem_ready() -> void:
	pass # Replace with function body.
