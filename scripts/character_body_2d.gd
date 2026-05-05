extends CharacterBody2D

# Tamanho dos bloquinhos do mapa
const tilesize = 16

@onready var ray: RayCast2D = $Ray

var inputs = {
	"move_up": Vector2.UP,
	"move_down": Vector2.DOWN,
	"move_left": Vector2.LEFT,
	"move_right": Vector2.RIGHT,
}

# Controle de movimento contínuo
var move_delay = 0.15
var move_timer = 0.0
var is_moving = false

func _physics_process(delta):
	move_timer -= delta
	
	# Evita spam enquanto ainda está no tempo de espera
	if move_timer > 0 or is_moving:
		return
	
	for dir in inputs.keys():
		if Input.is_action_pressed(dir):
			move(dir)
			move_timer = move_delay
			break


func move(dir):
	var vector_pos = inputs[dir] * tilesize
	
	ray.target_position = vector_pos
	ray.force_raycast_update()
	
	if not ray.is_colliding():
		is_moving = true
		
		var tween = create_tween()
		tween.tween_property(self, "position", position + vector_pos, 0.1)
		tween.finished.connect(_on_move_finished)
		
		animation()


func _on_move_finished():
	is_moving = false

func animation():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.1, 0.9), 0.05)
	tween.tween_property(self, "scale", Vector2(0.9, 1.1), 0.05)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.05)
	
#Lista para guardar os itens coletados
var inventory: Array[String] = []

#Guarda a referência do objeto interativo que está mais próximo
var current_interactive = null

@onready var interaction_detector = $InteractionDetector 
