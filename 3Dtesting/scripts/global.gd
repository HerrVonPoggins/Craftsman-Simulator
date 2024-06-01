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
var trowel_picked = false
var save_path = "user://variable.save"
var mouse_sensitivity = 0.01
var stay = false
var let_go = false
var tutorial_finished = false
var string = false
var door_top = 0
var window_top = 0
var walking_on = null

var ground_grass = null
var ground_floor = null
var is_walking = false
var walk_sound_started = false
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
