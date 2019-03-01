extends Node2D

signal turret_bought

var defenses : Array
var active_defense = null
var Turret = load(Global.turret_res)
onready var res_manager = get_node(Global.ResourceManager_path)

func _ready():

	defenses = get_tree().get_nodes_in_group("defenses")
	connect("turret_bought", res_manager,"_substract_minerals")
	for def in defenses:
		def.connect("triggered_defense", self, "_on_triggered_defense")
		def.connect("built_defense", self, "_on_built_defense")

func _process(delta):
	if active_defense:
		for defense_child in active_defense.get_children():
			if "Turret" in defense_child.get_name() && get_tree().paused == false:
				defense_child.update_motion(delta)


func _on_triggered_defense(defense_spot):
	active_defense = defense_spot


func _on_built_defense(defense_spot):
	var t = Turret.instance()
	if res_manager.current_minerals >= t.turret_cost:
		emit_signal("turret_bought", t.turret_cost)
		var child_count = defense_spot.get_child_count()
		print('childs: ' + str(child_count))
		if child_count < 5:
			match child_count:

				3:
					t.position.x += 17
				4:
					t.position.x -= 17
			defense_spot.add_child(t)
		else:
			t.queue_free()


func _on_TurretCreationUI_basicTurretSelected():
	Turret = load(Global.turret_res)


func _on_TurretCreationUI_laserTurretSelected():
	Turret = load(Global.laser_turret_res)

