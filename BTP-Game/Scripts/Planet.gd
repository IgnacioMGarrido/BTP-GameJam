extends KinematicBody2D

signal hit_points_updated
signal game_over_signal

export var max_damage_points_to_kill_minion = 8

var hit_points = 100
var damage_to_kill_minion = 0

func _ready():
	emit_signal('hit_points_updated', hit_points)

func on_hit():
	hit_points -= 5
	
	if hit_points <= 0:
		emit_signal('game_over_signal')
	
	emit_signal('hit_points_updated', hit_points)
	
	if get_tree().get_nodes_in_group('minions').size() > 0:
		damage_to_kill_minion += 1
	
	if damage_to_kill_minion >= max_damage_points_to_kill_minion:
		if get_tree().get_nodes_in_group('minions').size() > 0:
			get_tree().get_nodes_in_group('minions').pop_front().kill()
		damage_to_kill_minion = 0


