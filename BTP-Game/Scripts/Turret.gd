extends StaticBody2D

class_name Turret

var active = true
onready var pivot : Position2D = $TurretPivot
onready var bullet_spawn : Position2D = $TurretPivot/Sprite/ProjectileSpawn
var Bullet = load(Global.bullet_res)

func _ready():
	pass


func update_motion(delta):
	if active:
		pivot.look_at(get_global_mouse_position())
		if Input.is_action_just_pressed("ui_accept"):
			shoot_projectile()


func shoot_projectile():
	var b = Bullet.instance()
	b.start(bullet_spawn.global_position, bullet_spawn.global_rotation)
	get_node("/root/MainScene").add_child(b)

