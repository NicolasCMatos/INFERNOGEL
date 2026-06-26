extends Area2D

@export var timeline_name: String = "minha_timeline_exemplo"

func _on_body_entered(body):
	print("Algo entrou na área: ", body.name) # Avisa se qualquer coisa encostou
	
	if body.is_in_group("player"):
		print("O Jogador foi detectado com sucesso!")
		
		if Dialogic.current_timeline != null:
			print("Ops! Já existe um diálogo rodando agora.")
			return
		
		print("Tentando iniciar a timeline: ", timeline_name)
		Dialogic.start(timeline_name)
	else:
		print("O objeto que entrou NÃO está no grupo 'player'.")
