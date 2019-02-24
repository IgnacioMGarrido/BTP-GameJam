extends Node2D

export (PackedScene) var Mob

func _ready():
	randomize()
	
func _on_MobTimer_timeout():
	#Choose Random Location
	$MobPath/MobSpawnLocation.set_offset(randi())
	#Create Mob at location
	var mob = Mob.instance()
	add_child(mob)
	mob.position = $MobPath/MobSpawnLocation.position