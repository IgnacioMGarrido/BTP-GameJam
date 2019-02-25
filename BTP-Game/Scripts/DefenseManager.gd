extends Node2D

var defenses : Array
var active_defense = null
var Turret = load(Global.turret_res)

func _ready():
	defenses = get_tree().get_nodes_in_group("defenses")
	for def in defenses:
		def.connect("triggered_defense", self, "_on_triggered_defense")
		def.connect("built_defense", self, "_on_built_defense")

func _process(delta):
	if active_defense:
		for defense_child in active_defense.get_children():
			if "Turret" in defense_child.get_name():
				defense_child.update_motion(delta)


func _on_triggered_defense(defense_spot):
	active_defense = defense_spot


func _on_built_defense(defense_spot):
	var child_count = defense_spot.get_child_count()
	if child_count < 5:
		var t = Turret.instance()
		match child_count:
			3:
				t.position.x += 17
			4:
				t.position.x -= 17
		defense_spot.add_child(t)