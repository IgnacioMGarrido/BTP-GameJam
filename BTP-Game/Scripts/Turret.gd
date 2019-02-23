extends StaticBody2D


onready var pivot : Position2D = $TurretPivot
onready var bullet_spawn : Position2D = $TurretPivot/Sprite/ProjectilSpawn


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_motion(delta)
	

func update_motion(delta):
	pivot.look_at(get_global_mouse_position())
	if Input.is_mouse_button_pressed(0):
		shoot_projectile()
		

func shoot_projectile():
	var bullet = load(Global.bullet_res).instance()
	#bullet.start
	pass
