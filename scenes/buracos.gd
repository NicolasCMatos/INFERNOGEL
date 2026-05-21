extends Area2D

@export var local_de_retorno: Node2D

func _on_body_entered(body):
	print("Algo caiu no buraco: ", body.name)
	
