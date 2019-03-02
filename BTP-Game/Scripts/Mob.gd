extends KinematicBody2D

class_name Mob


onready var destination = get_node("/root/MainScene/Planet").global_position

var direction : Vector2
var velocity : Vector2
var speed = 50

func _ready():
	$AnimationPlayer.playback_speed = 1.75
	$AnimationPlayer.play("roll")


func _physics_process(delta):
	direction = (destination - global_position).normalized()
	velocity = Vector2(speed, speed) * direction

	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("on_hit"):
			collision.collider.on_hit()
		on_hit()


func on_hit():
	queue_free()

