extends KinematicBody2D

class_name Bullet

const G = 200000
var center : Vector2

var speed : float = 60
var velocity : Vector2

func _ready():
	center = get_node("/root/MainScene/Planet").global_position

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func acceleration(pos1 : Vector2, pos2 : Vector2):
	var direction = pos1 - pos2
	var length = sqrt(pow(direction.x, 2) + pow(direction.y, 2))
	var normal_dir = direction.normalized()
	
	return Vector2(normal_dir.x * (G / pow(length,2)), normal_dir.y * (G / pow(length,2)))



func _physics_process(delta):
	velocity += acceleration(center, self.position) * delta
	var collision = move_and_collide(velocity * delta)
	
	
#	if collision:
#		velocity = velocity.bounce(collision.normal)
#		if collision.collider.has_method("hit"):
#			collision.collider.hit()

	
func _on_VisibilityNotifier2D_screen_exited():
    queue_free()