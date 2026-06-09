extends Node2D

@onready var puzzle: Control = $"../QuebraCabeça/QuebraCabeça"

func _ready():

	puzzle.puzzle_concluido.connect(open_door)

func open_door():

	$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)

	$Sprite2D.visible = false

	print("Porta aberta!")
