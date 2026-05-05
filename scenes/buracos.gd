extends Area2D

@export var local_de_retorno: Node2D

func _on_body_entered(body):
	print("Algo caiu no buraco: ", body.name)
	
	if body.is_in_group("player"):
		if local_de_retorno:
			body.global_position = local_de_retorno.global_position
			# Se o player for CharacterBody2D, zere a velocidade para ele não 'nascer' caindo de novo
			if body is CharacterBody2D:
				body.velocity = Vector2.ZERO
			print("Jogador retornado com sucesso!")
		else:
			print("ERRO: Este buraco específico não tem um local_de_retorno definido no Inspector!")



func _on_buraco_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_buraco_2_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_buraco_3_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
