extends Turret


onready var laser_light : Light2D = $"TurretPivot/Sprite/ProjectileSpawn/Laser"
onready var laser_light_2 : Light2D = $"TurretPivot2/Sprite/ProjectileSpawn/Laser"
onready var laser_light_3 : Light2D = $"TurretPivot2/Sprite/ProjectileSpawn/Laser"
onready var laser_light_4 : Light2D = $"TurretPivot2/Sprite/ProjectileSpawn/Laser"

onready var laser_rc : RayCast2D = $"TurretPivot/Sprite/ProjectileSpawn/Laser/RayCast2D"
onready var laser_rc_2 : RayCast2D = $"TurretPivot2/Sprite/ProjectileSpawn/Laser/RayCast2D"
onready var laser_rc_3 : RayCast2D = $"TurretPivot3/Sprite/ProjectileSpawn/Laser/RayCast2D"
onready var laser_rc_4: RayCast2D = $"TurretPivot4/Sprite/ProjectileSpawn/Laser/RayCast2D"

onready var laser_sprite : Sprite = $"TurretPivot/Sprite/ProjectileSpawn/Laser/Sprite"
onready var laser_sprite_2 : Sprite = $"TurretPivot2/Sprite/ProjectileSpawn/Laser/Sprite"
onready var laser_sprite_3 : Sprite = $"TurretPivot3/Sprite/ProjectileSpawn/Laser/Sprite"
onready var laser_sprite_4 : Sprite = $"TurretPivot4/Sprite/ProjectileSpawn/Laser/Sprite"

var laser_components = []

onready var wait_timer = $"WaitTimer"
onready var laser_timer = $"LaserTimer"

func update_motion(delta):
	pass

func shoot_projectile():
	pass

func _ready():
	self.pause_mode = Node.PAUSE_MODE_STOP
	$AnimationPlayer.play("rotate_barrel")

	laser_components.push_back(laser_light)
	laser_components.push_back(laser_light_2)
	laser_components.push_back(laser_light_3)
	laser_components.push_back(laser_light_4)
	
	laser_components.push_back(laser_rc)
	laser_components.push_back(laser_rc_2)
	laser_components.push_back(laser_rc_3)
	laser_components.push_back(laser_rc_4)
	
	laser_components.push_back(laser_sprite)
	laser_components.push_back(laser_sprite_2)
	laser_components.push_back(laser_sprite_3)
	laser_components.push_back(laser_sprite_4)
	
	_enable_objects(false)
	wait_timer.start()
	
	
func _physics_process(delta):
	
	if laser_rc.is_colliding():
		if laser_rc.get_collider().has_method("on_hit"):
			laser_rc.get_collider().on_hit()
	
	if laser_rc_2.is_colliding():
		if laser_rc_2.get_collider().has_method("on_hit"):
			laser_rc_2.get_collider().on_hit()
			
	if laser_rc_3.is_colliding():
		if laser_rc_3.get_collider().has_method("on_hit"):
			laser_rc_3.get_collider().on_hit()
			
	if laser_rc_4.is_colliding():
		if laser_rc_4.get_collider().has_method("on_hit"):
			laser_rc_4.get_collider().on_hit()
	


func _on_WaitTimer_timeout():
	_enable_objects(true)
	laser_timer.start()

func _on_LaserTimer_timeout():
	_enable_objects(false)
	laser_timer.stop()
	wait_timer.start()

func _enable_objects(var is_enabled):

	for comp in laser_components:
		match comp.get_class():
			'Light2D':
				comp.enabled = is_enabled
			'RayCast2D':
				comp.enabled = is_enabled
			'Sprite':
				comp.visible = is_enabled






