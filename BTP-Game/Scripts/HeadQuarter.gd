extends Area2D

var Minion = load(Global.minion_res)


func _on_Timer_timeout():
	if get_child_count() < 6:
		var m = Minion.instance()
		add_child(m)


	
