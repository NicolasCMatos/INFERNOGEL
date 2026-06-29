extends Node2D

@onready var puzzle: Control = $"../QuebraCabeça/QuebraCabeça"
@onready var portasom: AudioStreamPlayer = $portasom

func _ready():

	puzzle.puzzle_concluido.connect(open_door)

func open_door():
	portasom.play()

	$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)

	$Sprite2D.visible = false

	print("Porta aberta!")
