extends MarginContainer

signal basicTurretSelected
signal laserTurretSelected


func _on_BasicTurretButton_pressed():
	emit_signal("basicTurretSelected")
	


func _on_LaserTurretButton_pressed():
	emit_signal("laserTurretSelected")
		
