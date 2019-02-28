extends KinematicBody2D

export var max_damage_points_to_kill_minion = 8

var hit_points = 100
var damage_to_kill_minion = 0


func on_hit():
	hit_points -= 1
	print(damage_to_kill_minion)
	
	if get_tree().get_nodes_in_group('minions').size() > 0:
		damage_to_kill_minion += 1
	
	if damage_to_kill_minion >= max_damage_points_to_kill_minion:
		if get_tree().get_nodes_in_group('minions').size() > 0:
			get_tree().get_nodes_in_group('minions').pop_front().kill()
		damage_to_kill_minion = 0
			
	print('Planet hit')

