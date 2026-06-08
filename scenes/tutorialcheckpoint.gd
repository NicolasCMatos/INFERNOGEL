extends Area2D

@export var painel_popup: Panel

var tutorial_ja_foi_visto: bool = false

func _ready() -> void:
	if painel_popup:
		painel_popup.visible = false

# Quando o jogador entra na área
func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
		
	if not tutorial_ja_foi_visto:
		print("Jogador entrou! Ativando o pop-up com tempo definido.")
		
		if painel_popup:
			painel_popup.visible = true
			
		tutorial_ja_foi_visto = true
		await get_tree().create_timer(4.0).timeout
		
		fechar_tutorial_automatico()

func fechar_tutorial_automatico() -> void:
	if painel_popup and painel_popup.visible:
		print("O tempo acabou. Fechando o pop-up automaticamente.")
		painel_popup.visible = false

func _on_body_exited(body: Node2D) -> void:
	pass
