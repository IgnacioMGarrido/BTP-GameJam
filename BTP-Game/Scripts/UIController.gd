extends Control

onready var res_manager = get_node(Global.ResourceManager_path)

onready var minerals_label = $"ColorRect/HBoxContainer/current_minerals"

func _ready():
	minerals_label.text = "0"
	res_manager.connect("minerals_updated",self,"_on_minerals_updated")
	
func _on_minerals_updated(var new_minerals):
	minerals_label.text = str(new_minerals)
	