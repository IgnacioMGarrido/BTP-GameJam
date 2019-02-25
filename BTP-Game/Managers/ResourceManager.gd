extends Node2D

var current_minerals = 0 

func _on_minion_mineral_delivered(var mineral_value):
	current_minerals += mineral_value
	print(current_minerals)
