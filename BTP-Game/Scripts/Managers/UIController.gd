extends Control

onready var res_manager = get_node(Global.ResourceManager_path)

onready var minerals_label = $"HBoxContainer/MineralsContainer/MineralCounter"

func _ready():
	minerals_label.text = "0"
	res_manager.connect("minerals_updated",self,"_on_minerals_updated")
	
func _on_minerals_updated(var new_minerals):
	minerals_label.text = str(new_minerals)
	
func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = not get_tree().paused