extends Node2D

func _on_Planet_game_over_signal():
	#TODO: Add GUI maybe
	get_tree().reload_current_scene()

