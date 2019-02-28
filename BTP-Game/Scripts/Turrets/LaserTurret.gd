extends Turret

onready var laser_light = $"TurretPivot/Sprite/ProjectileSpawn/Laser"
onready var laser_sprite = $"TurretPivot/Sprite/ProjectileSpawn/Laser/Sprite"
onready var laser_rc : RayCast2D = $"TurretPivot/Sprite/ProjectileSpawn/Laser/RayCast2D"

onready var wait_timer = $"WaitTimer"
onready var laser_timer = $"LaserTimer"

func _ready():
	$AnimationPlayer.play("rotate_barrel")
	_enable_objects(false)
	wait_timer.start()
	
func _physics_process(delta):
	if laser_rc.is_colliding():
		if laser_rc.get_collider().has_method("on_hit"):
			laser_rc.get_collider().on_hit()

func update_motion(delta):
	pass

func shoot_projectile():
	pass


func _on_WaitTimer_timeout():
	_enable_objects(true)
	laser_timer.start()

func _on_LaserTimer_timeout():
	_enable_objects(false)
	laser_timer.stop()
	wait_timer.start()
	

func _enable_objects(var is_enabled):
	laser_light.enabled = is_enabled
	laser_sprite.visible = is_enabled
	laser_rc.enabled = is_enabled


