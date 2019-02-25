extends Node2D

var defenses : Array
var active_defense = null

func _ready():
	defenses = get_tree().get_nodes_in_group("defenses")
	for def in defenses:
		def.connect("trigger_defense", self, "_on_trigger_defense")
	

func _process(delta):
	if active_defense:
		if active_defense.get_child_count() == 3:
			active_defense.get_child(2).update_motion(delta)


func _on_trigger_defense(defense_spot):
	active_defense = defense_spot