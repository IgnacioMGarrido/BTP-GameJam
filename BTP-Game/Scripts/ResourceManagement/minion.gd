extends KinematicBody2D

class_name Minion

signal mineral_delivered 

onready var ResourceManagement = get_parent().get_parent().get_parent()
onready var head_quarter = get_parent().get_parent()#get_node("/root/MainScene/Planet/ResourceManagement/HeadQuarter") 
onready var mine = ResourceManagement.get_child(1)#get_node("/root/MainScene/Planet/ResourceManagement/Mine")
onready var mineral_sprite = $Sprite/mineral_sprite

export var mineral_cost = 20

var direction : Vector2
var velocity : Vector2
var destination : Vector2
var speed = 10

var mineral_value = 10
var has_mineral = false



func _ready():
	add_to_group('minions')
	print(get_parent().name)
	connect("mineral_delivered", ResourceManagement, "_on_minion_mineral_delivered")
	head_quarter.connect("body_shape_entered", self, "_on_HeadQuarter_body_shape_entered")
	mine.connect("body_shape_entered", self, "_on_Mine_body_shape_entered")
	mineral_sprite.visible = false
	destination = mine.global_position

func _physics_process(delta):
	direction = (destination - global_position).normalized()
	velocity = Vector2(speed, speed) * direction
	var collision = move_and_collide(velocity * delta)


func _on_Mine_body_shape_entered(body_id, body, body_shape, area_shape):
	if body == self:
		destination = head_quarter.global_position
		has_mineral = true
		mineral_sprite.visible = true


func _on_HeadQuarter_body_shape_entered(body_id, body, body_shape, area_shape):
	if body == self:
		destination = mine.global_position
		if has_mineral:
			emit_signal("mineral_delivered",mineral_value)
			has_mineral = false
			mineral_sprite.visible = false

func kill():
	queue_free()
