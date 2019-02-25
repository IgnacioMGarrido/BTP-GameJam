extends KinematicBody2D

class_name Mob


onready var destination = get_node("/root/MainScene/Planet").global_position

var direction : Vector2
var velocity : Vector2
var speed = 75


	
func _physics_process(delta):

	direction = (destination - global_position).normalized()
	velocity = Vector2(speed, speed) * direction

	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("on_hit"):
			collision.collider.on_hit()
			hit()
		queue_free()
		
	
func hit():
	queue_free()
func on_mob_hit():
	queue_free()
