extends Area2D

@export var local_de_retorno: Node2D

func _on_body_entered(body):
	print("Algo caiu no buraco: ", body.name)
	


func _on_personagem_ready() -> void:
	pass # Replace with function body.


func _on_button_pressed() -> void:
	pass # Replace with function body.


func _on_botao_1_au_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_botao_1_au_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_botao_2_au_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_botao_2_au_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
