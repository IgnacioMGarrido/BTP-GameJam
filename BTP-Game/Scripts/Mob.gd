extends KinematicBody2D

class_name Mob


onready var destination = get_node("/root/MainScene/Planet").global_position

var direction : Vector2
var velocity : Vector2
var speed = 75


func _ready():

	pass

	
func _process(delta):
	if velocity != null:
		direction = (destination - global_position).normalized()
		velocity = Vector2(speed, speed) * direction

	var collision = move_and_collide(velocity * delta)
