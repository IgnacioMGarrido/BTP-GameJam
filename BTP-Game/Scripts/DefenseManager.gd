extends Node2D

var defenses : Array
onready var ray = $"../RayCast2D"
onready var camera : Camera2D = $".."
var ray_length = 1000

func _ready():
	defenses = get_tree().get_nodes_in_group("defenses")

func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * ray_length
		ray.get_viewport_transform().position = from
		ray.cast_to(to)
		
		print(ray.get_collider().get_class())
			
		
		for def in defenses:
			def.active = !def.active