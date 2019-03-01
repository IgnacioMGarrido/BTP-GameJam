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


func _on_built_defense(defense_spot, event):
	var t = Turret.instance()
	
	if res_manager.current_minerals >= t.turret_cost:
		var spot_1 = defense_spot.get_node("Spot1")
		var spot_2 = defense_spot.get_node("Spot2")
		var spot_3 = defense_spot.get_node("Spot3")
		var taken_spots = spot_1.get_child_count() + spot_2.get_child_count() + spot_3.get_child_count()
		
		if Turret.get_path().ends_with("QuadLaserTurret.tscn"):
			if taken_spots == 0 && defense_spot.get_child_count() == 5:
				defense_spot.add_child(t)
				emit_signal("turret_bought", t.turret_cost)
			else:
				t.queue_free()
		else:
			if taken_spots < 3 && defense_spot.get_child_count() == 5: #No quad laser turrets
				var closest_spot = find_closest_spot(spot_1, spot_2, spot_3, event)
				closest_spot.add_child(t)
				emit_signal("turret_bought", t.turret_cost)
			else:
				t.queue_free()

func find_closest_spot(spot_1, spot_2, spot_3, event):
	var closest_spot = null
	var min_distance = null
	
	if spot_1.get_child_count() == 0:
		var distance = event.global_position.distance_to(spot_1.global_position)
		if min_distance == null || distance < min_distance:
			min_distance = distance
			closest_spot = spot_1
	if spot_2.get_child_count() == 0:
		var distance = event.global_position.distance_to(spot_2.global_position)
		if min_distance == null || distance < min_distance:
			min_distance = distance
			closest_spot = spot_2
	if spot_3.get_child_count() == 0:
		var distance = event.global_position.distance_to(spot_3.global_position)
		if min_distance == null || distance < min_distance:
			min_distance = distance
			closest_spot = spot_3
	
	return closest_spot


func _on_TurretCreationUI_basicTurretSelected():
	Turret = load(Global.turret_res)


func _on_TurretCreationUI_laserTurretSelected():
	Turret = load(Global.laser_turret_res)


func _on_TurretCreationUI_quadLaserSelected():
	#Turret = load(Global.laser_turret_res) 
	Turret = load(Global.quad_laser_turret_res)
