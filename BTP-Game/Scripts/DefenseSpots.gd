extends Node2D

var rot_speed = .2 #deg/second

func _physics_process(delta):
	# rotate the planet
	rotate(rot_speed * delta)