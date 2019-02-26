extends Node2D

class_name ResourceManager

var current_minerals = 0 

	
func _on_minion_mineral_delivered(var mineral_value):
	current_minerals += mineral_value
	#print(current_minerals)

func _substract_minerals(var value):
	current_minerals -= value
	print(current_minerals)