extends Node2D

#scene transition
func _ready():
	$AnimationPlayer.play("fade_in")
	Global.checklist_hide = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
#change back to titlescreen
func _on_button_pressed():
	Music._play_button()
	Global.checklist_hide = true
	Global.concrete = false
	Global.wall_finished = false
	Global.concrete_mixed = false

	Global.brick_sawed = false
	Global.brick_saw_cam = false

	Global.isolation = false
	Global.current_scene = 0
	Global.dialogue_open = false

	Global.trowel_picked = false
	Global.spirit_level_picked = false

	Global.save_path = "user://variable.save"
	Global.mouse_sensitivity = 0.005
	Global.stay = false
	Global.let_go = false
	Global.tutorial_finished = false
	Global.string = false
	Global.door_top = 0
	Global.window_top = 0
	Global.walking_on = null
	Global.spirit_level = false
	Global.ground_grass = null
	Global.ground_floor = null
	Global.is_walking = false
	Global.walk_sound_started = false
	Global.dialogue_count = 0
	Global.dialogue_replay = 0

	Global.press_e = false
	Global.talkable = false
	Global.activateable = false

	Global.rods = 0
	Global.crane_on = false
	Global.can_make_roof = false
	Global.brick_1 = false	
	Global.brick_2 = false
	Global.brick_3 = false
	Global.concrete_1 = false
	Global.concrete_2 = false
	Global.concrete_3 = false
	Global.start_crane_game = false
	Global.roof_finished = false
	Global.concrete_filled_roof = false
	Global.placing_games_open = false
	Global.crosshair_off = false 
	Global.brick_is_being_placed = false
	Global.filler_started = false

	Global.checklist_hide = false
	Global.dialogue_played = 0
	Global.book_ready = false
	Global.skip = 0
	
	Global.holding_bricks = false
	Global.holding_bucket = false
	Global.holding_bag = false
	Global.is_holding = false
	Global.can_extend = false

	Global.plaster_on = false
	Global.curcuit_minigame_on = false
	Global.switch_minigame_on = false
	Global.plaster_mixing = false
	Global.power_box = false
	Global.saw_wall = false

	Global.sound_count = 6
	Global.musik_count = 6
	Global.mouse_sense = 6

	Global.player_visibility = true

	Global.door_done = 0

	Global.wall_sawed = false
	Global.plaster_done = false
	Global.can_power = 0




	$transition._change_scene("res://ui/screens/titlescreen.tscn")
