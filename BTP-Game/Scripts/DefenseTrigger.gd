extends Area2D

signal triggered_defense
signal built_defense

func _ready():
	add_to_group("defenses")

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		if event.button_index == 1:
			emit_signal("triggered_defense", self)
		elif event.button_index == 2:
			emit_signal("built_defense", self)
