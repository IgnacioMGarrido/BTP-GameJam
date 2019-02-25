extends KinematicBody2D

class_name Minion

signal mineral_delivered 

onready var head_quarter = get_node("/root/MainScene/Planet/ResourceManagement/HeadQuarter").global_position 
onready var mine = get_node("/root/MainScene/Planet/ResourceManagement/Mine").global_position
onready var mineral_sprite = $Sprite/mineral_sprite


var direction : Vector2
var velocity : Vector2
var destination : Vector2
var speed = 10

var mineral_value = 10
func _ready():
	mineral_sprite.visible = false
	destination = mine

func _physics_process(delta):
	direction = (destination - global_position).normalized()
	velocity = Vector2(speed, speed) * direction
	var collision = move_and_collide(velocity * delta)
#	pass

func _on_Mine_body_shape_entered(body_id, body, body_shape, area_shape):
	if body == self:
		print("Mine")
		destination = head_quarter
		print(destination)
		mineral_sprite.visible = true


func _on_HeadQuarter_body_shape_entered(body_id, body, body_shape, area_shape):
	if body == self:
		destination = mine
		print(destination)
		emit_signal("mineral_delivered",mineral_value)
		mineral_sprite.visible = false
