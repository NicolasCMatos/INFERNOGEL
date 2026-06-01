extends Node

var peças = 0
@onready var peças_label: Label = $CanvasLayer/PeçasLabel

func add_peça():
	peças += 1
	peças_label.text = "Peças:" + str(peças) + '/9'
