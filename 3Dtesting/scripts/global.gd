extends Node

#global script

#variables that are used in multiple scenes
var concrete = false
var wall_finished = false
var concrete_mixed = false
var brick_sawed = false
var isolation = false
var current_scene = 0
var dialogue_open = false
var volume = 0
var trowel_picked = false
var save_path = "user://variable.save"
var mouse_sensitivity = 0.01

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(current_scene)
	

func load_save():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		current_scene = file.get_var(current_scene)
	else:
		print("no data")
		current_scene = 0
