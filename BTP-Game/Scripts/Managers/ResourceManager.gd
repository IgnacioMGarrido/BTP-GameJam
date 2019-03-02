extends Node2D

signal minerals_updated

class_name ResourceManager

export var current_minerals = 10000

	
func _on_minion_mineral_delivered(var mineral_value):
	current_minerals += mineral_value
	emit_signal("minerals_updated", current_minerals)
	#print(current_minerals)

func _substract_minerals(var value):
	current_minerals -= value
	emit_signal("minerals_updated", current_minerals)
	#print(current_minerals)