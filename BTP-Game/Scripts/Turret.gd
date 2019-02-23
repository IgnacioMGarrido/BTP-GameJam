extends StaticBody2D

class_name Turret

var is_active = true
onready var pivot : Position2D = $TurretPivot
onready var bullet_spawn : Position2D = $TurretPivot/Sprite/ProjectilSpawn
var Bullet = load(Global.bullet_res)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_motion(delta)
	

func update_motion(delta):
	
	if is_active:
		pivot.look_at(get_global_mouse_position())
		if Input.is_action_just_pressed("ui_accept"):
			shoot_projectile()


func shoot_projectile():
	var b = Bullet.instance()
	b.start(bullet_spawn.global_position, bullet_spawn.global_rotation)
	get_parent().add_child(b)

	