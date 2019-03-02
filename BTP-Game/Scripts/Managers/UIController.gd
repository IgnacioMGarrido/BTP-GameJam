extends Control

const DURATION = .4

onready var res_manager = get_node(Global.ResourceManager_path)

onready var minerals_label = $"HBoxContainer/MineralsContainer/MineralCounter"
onready var hp_label = $"HBoxContainer/HPContainer/NinePatchRect/MarginContainer/HPValue"
onready var life_progress_bar = $"HBoxContainer/HPContainer/TextureProgress"

onready var tween : Tween = $"Tween"

func _ready():
	minerals_label.text = "200"
	res_manager.connect("minerals_updated",self,"_on_minerals_updated")
	
func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = not get_tree().paused

func _on_minerals_updated(var new_minerals):
	minerals_label.text = str(new_minerals)

func _on_Planet_hit_points_updated(var hit_points):
	hp_label.text = str(hit_points)
	tween.interpolate_property(life_progress_bar, 'value', life_progress_bar.value, hit_points, DURATION, Tween.TRANS_QUAD, Tween.EASE_IN)
	tween.start()

