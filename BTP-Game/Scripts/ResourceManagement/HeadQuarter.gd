extends Area2D

signal create_worker

onready var minion_parent = get_child(2)
var Minion = load(Global.minion_res)
onready var res_manager = $".."


func _on_HeadQuarter_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed :
		if event.button_index == 1:
			if minion_parent.get_child_count() < 16:
				var m = Minion.instance()
				if m.mineral_cost <= res_manager.current_minerals:
					res_manager._substract_minerals(m.mineral_cost)
					minion_parent.add_child(m)

