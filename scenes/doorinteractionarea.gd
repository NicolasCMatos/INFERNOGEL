extends Area2D

#Redireciona a chamada de interação para o nó pai (a Porta)
func interact(character):
	get_parent().interact(character)
