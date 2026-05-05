extends Area2D

@export var camera: Camera2D 
@export var zoom_distante: Vector2 = Vector2(1.3, 1.3) 
@export var zoom_normal: Vector2 = Vector2(5.0, 5.0)   

func _on_body_entered(body):
	if body.is_in_group("player"):
	  
		var tween = create_tween()
		tween.tween_property(camera, "zoom", zoom_distante, 1.0).set_trans(Tween.TRANS_SINE)

func _on_body_exited(body):
	if body.is_in_group("player"):

		var tween = create_tween()
		tween.tween_property(camera, "zoom", zoom_normal, 1.0).set_trans(Tween.TRANS_SINE)
