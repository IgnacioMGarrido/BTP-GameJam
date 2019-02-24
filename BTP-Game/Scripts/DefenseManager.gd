extends Node2D

var defenses : Array

func _ready():
	defenses = get_tree().get_nodes_in_group("defenses")

func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		for def in defenses:
			def.active = !def.active