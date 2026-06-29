extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

var scene_to_load: String
var color_rect_tween: Tween

func change_scene_to(scene_path: String) -> void:
	if color_rect_tween:
		color_rect_tween.kill()

	scene_to_load = scene_path

	# Garante que o fade começa transparente
	color_rect.modulate.a = 0.0

	# Cria o tween
	color_rect_tween = create_tween()
	color_rect_tween.set_trans(Tween.TRANS_SINE)
	color_rect_tween.set_ease(Tween.EASE_IN_OUT)

	# Fade para preto
	color_rect_tween.tween_property(color_rect, "modulate:a", 1.0, 0.2)

	# Quando terminar o fade, troca de cena
	color_rect_tween.finished.connect(load_new_scene)


func load_new_scene() -> void:
	get_tree().change_scene_to_file(scene_to_load)
