extends StaticBody2D


onready var pivot : Position2D = $TurretPivot

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_motion(delta)
	

func update_motion(delta):
	pivot.look_at(get_global_mouse_position() )
