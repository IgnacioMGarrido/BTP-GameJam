extends LaserTurret

onready var laser_rc_2 : RayCast2D = $"TurretPivot2/Sprite/ProjectileSpawn/Laser/RayCast2D"
onready var laser_r_3 : RayCast2D = $"TurretPivo3/Sprite/ProjectileSpawn/Laser/RayCast2D"
onready var laser_rc_4: RayCast2D = $"TurretPivot4/Sprite/ProjectileSpawn/Laser/RayCast2D"





func _ready():
	self.pause_mode = Node.PAUSE_MODE_STOP
	$AnimationPlayer.play("rotate_barrel")
	_enable_objects(false)
	wait_timer.start()
	
	

func _enable_objects(var is_enabled):
	pass