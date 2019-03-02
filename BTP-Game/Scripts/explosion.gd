extends Node2D

func _ready():
	$"AnimationPlayer".play("Explode")

func start(pos):
	#rotation = dir
	position = pos


func _on_Timer_timeout():
	queue_free()
