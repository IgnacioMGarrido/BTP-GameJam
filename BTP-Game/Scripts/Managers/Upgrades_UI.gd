extends Control



export var basic_upgrade_cost = 600

onready var bulletButton = $"VBoxContainer/BulletUpgradeButton"
onready var res_manager = get_node(Global.ResourceManager_path)



func _on_BulletUpgradeButton_pressed():
	if res_manager.current_minerals >= basic_upgrade_cost:
		$"AudioStreamPlayer".play()
		res_manager._substract_minerals(basic_upgrade_cost)
		bulletButton.disabled = true
		visible = false
		Global.basic_turret_upgraded = true
	
