extends Node

var peças = 0
@onready var pecas_label: Label = $CanvasLayer/PeçasLabel
@onready var checkpoint2: Area2D = $checkpoints/checkpoint2
@onready var porta: StaticBody2D= $Porta
var pecas_coletadas: int = 0
signal pecas_atualizadas(quantidade_atual: int)
	
func add_peça():
	pecas_coletadas += 1
	pecas_label.text = "Peças:" + str(pecas_coletadas) + '/9'
	pecas_atualizadas.emit(pecas_coletadas)
