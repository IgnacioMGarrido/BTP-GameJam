extends StaticBody2D

class_name Turret

var PI_2 = PI/2
export var hit_points = 3
export var turret_cost = 100
export (PackedScene) var Bullet


var active = true

onready var pivot : Position2D = $TurretPivot
onready var dummy_pivot : Position2D = $DummyPivot
onready var bullet_spawn : Position2D = $TurretPivot/Sprite/ProjectileSpawn


func _ready():
	
	add_to_group('turrets')
	if Bullet == null:
		print("No bullet assigned. Assinging the basic one")
		Bullet = load(Global.bullet_res)
func update_motion(delta):
	if active:
		dummy_pivot.look_at(get_global_mouse_position())
		
		#Reset rotation value to 0 if it's beyond 180 or -180 degrees
		if dummy_pivot.rotation > PI:
			dummy_pivot.rotation -= PI
		elif dummy_pivot.rotation < -PI:
			dummy_pivot.rotation += PI
		
		#Mirror rotation beyond 90 or -90 degrees
		if dummy_pivot.rotation > PI_2:
			pivot.rotation = dummy_pivot.rotation - 2*(dummy_pivot.rotation - PI_2)
		elif dummy_pivot.rotation < -PI_2:
			pivot.rotation = dummy_pivot.rotation - 2*(dummy_pivot.rotation + PI_2)
		else:
			pivot.rotation = dummy_pivot.rotation
		
		if Input.is_action_just_pressed("shoot"):
			shoot_projectile()


func shoot_projectile():
	if Global.basic_turret_upgraded == true:
		Bullet = load(Global.explosive_bullet_res)
	
	var b = Bullet.instance()

	b.start(bullet_spawn.global_position, bullet_spawn.global_rotation)
	get_node("/root/MainScene").add_child(b)

func on_hit():
	$AnimationPlayer.play("hit")
	hit_points -= 1
	if hit_points <= 0:
		kill()

func kill():
	var explosion = load(Global.turret_explosion_res)
	var e = explosion.instance()
	e.start(global_position)
	get_node("/root/MainScene").add_child(e)
	queue_free()






