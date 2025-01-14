extends Node

#global script

#variables that are used in multiple scenes
var concrete = false
var wall_finished = false
var concrete_mixed = false

var generator_on = 0
var brick_sawed = false
var brick_saw_cam = false

var isolation = false
var current_scene = 0
var dialogue_open = false
var carpenter_checkstate = 0
var electric_checkstate = 0
var trowel_picked = false
var spirit_level_picked = false

var save_path = "user://variable.save"
var mouse_sensitivity = 0.005
var stay = false
var let_go = false
var tutorial_finished = false
var string = false
var door_top = 0
var window_top = 0
var walking_on = null
var spirit_level = false
var ground_grass = null
var ground_floor = null
var is_walking = false
var walk_sound_started = false
var dialogue_count = 0
var dialogue_replay = 0



var press_e = false
var talkable = false
var activateable = false



var rods = 0
var crane_on = false
var can_make_roof = false
var brick_1 = false	
var brick_2 = false
var brick_3 = false
var concrete_1 = false
var concrete_2 = false
var concrete_3 = false
var start_crane_game = false
var roof_finished = false
var concrete_filled_roof = false
var placing_games_open = false
var crosshair_off = false 
var brick_is_being_placed = false
var filler_started = false


var checklist_hide = false
var dialogue_played = 0
var book_ready = false
var skip = 0
#for animations

var holding_bricks = false
var holding_bucket = false
var holding_bag = false
var is_holding = false
var can_extend = false

var plaster_on = false
var curcuit_minigame_on = false
var switch_minigame_on = false
var plaster_mixing = false
var power_box = false
var saw_wall = false

var sound_count = 6
var musik_count = 6
var mouse_sense = 6

var player_visibility = true

var door_done = 0

var wall_sawed = false
var plaster_done = false
var can_power = 0
#save and load func

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
