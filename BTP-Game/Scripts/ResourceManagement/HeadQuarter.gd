extends Area2D

signal create_worker

onready var minion_parent = get_child(2)
var Minion = load(Global.minion_res)


func _on_HeadQuarter_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		if event.button_index == 1:
			if minion_parent.get_child_count() < 9:
				var m = Minion.instance()
				minion_parent.add_child(m)

