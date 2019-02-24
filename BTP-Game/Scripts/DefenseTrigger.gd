extends Area2D

signal trigger_defense

func _ready():
	add_to_group("defenses")

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		emit_signal("trigger_defense", self)
