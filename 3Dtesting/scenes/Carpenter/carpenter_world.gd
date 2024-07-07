extends Node3D

var doors_done = 0
var metallbinder_count = 0
var played = false
var played2 = false
var played3 = false
var played4 = false
var played5 = false
var played6 = false
var played7 = false
var played8 = false
var played9 = false
var played10 = false
var played11 = false



# Called when the node enters the scene tree for the first time.
func _ready():
	Checklist._movement_visual()
	Checklist._sprint_visual()
	Checklist._crouch_visual()
	$Enter.play("fade_in")
	Global.current_scene = 2
	Global.walking_on = $"Map/map/Boden modified/StaticBody3D"
	#$Enter.play("fade_in")
	Global.ground_grass = $"Map/map/Boden modified/StaticBody3D".get_instance_id()
	DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/zimmermann_intro.dialogue"))
	await get_tree().create_timer(8).timeout
	Checklist._movement_visual_hide()
	Checklist._sprint_visual_hide()
	Checklist._crouch_visual_hide()
	
	Checklist._mouse_left_visual()
	Checklist._interact_visual()
	Checklist._mouse_right_visual()
	await get_tree().create_timer(8).timeout
	Checklist._interact_visual_hide()
	Checklist._mouse_right_visual_hide()
	Checklist._mouse_left_visual_hide()

func _on_stairs_dübel_minigame_finished():
	$Player/CharacterBody3D/Neck/Camera3D.current = true
	Global.stay = false
	Global.switch_minigame_on = false
	$Player.visible = true



func _on_stairs_player_visibility_off():
	$Player.visible = false

func _on_control_opened():
	get_tree().paused = true


func _on_control_closed():
	get_tree().paused = false



func _process(delta):
	if Input.is_action_just_pressed("kamera"):
		$Dachbinder.roof_step = 1

	
	if doors_done == 7:
		$Transition._change_scene("res://UI/screens/scene_change.tscn")
	if metallbinder_count >= 15:
		$Dachbinder.roof_step = 2
	if metallbinder_count >= 26:
		$Dachbinder.roof_step = 4
	if metallbinder_count >= 37:
		$Dachbinder.roof_step = 5
	if metallbinder_count >= 44:
		$Dachbinder.roof_step = 6
		
	#if metallbinder_count >= 6 and played == false:
		#played = true
		#$Dachbinder.get_node("RoofAnimations").play("hauptbinder_down")
		##await $Dachbinder.get_node("RoofAnimations").animation_finished
#
	#if metallbinder_count >= 6 and played2 == false:
		#played2 = true
		#$Dachbinder.get_node("RoofAnimations").play("eckbinder_down")
#
	#if metallbinder_count >= 6 and played3 == false:
		#played3 = true
		#$Dachbinder.get_node("RoofAnimations").play("schräg_links_down")
#
	#if metallbinder_count >= 6 and played4 == false:
		#played4 = true
		#$Dachbinder.get_node("RoofAnimations").play("schräg_rechts_down")
#
	#if metallbinder_count >= 6 and played5 == false:
		#played5 = true
		#$Dachbinder.get_node("RoofAnimations").play("walmbinder_down")
#
	#if metallbinder_count >= 6 and played6 == false:
		#played6 = true
		#$Dachbinder.get_node("RoofAnimations").play("dachplane_down")
#
	#if metallbinder_count >= 6 and played7 == false:
		#played7 = true
		#$Dachbinder.get_node("RoofAnimations").play("konterlattung_katten_down")
#
	#if metallbinder_count >= 6 and played8 == false:
		#played8 = true
		#$Dachbinder.get_node("RoofAnimations").play("konterlattung_stützen_down")
#
	#if metallbinder_count >= 6 and played9 == false:
		#played9 = true
		#$Dachbinder.get_node("RoofAnimations").play("vertikale_stützen_down")
#
	#if metallbinder_count >= 6 and played10 == false:
		#played10 = true
		#$Dachbinder.get_node("RoofAnimations").play("horizontale_stützen_down")
#
	#if metallbinder_count >= 6 and played11 == false:
		#played11 = true
		#$Dachbinder.get_node("RoofAnimations").play("dachziegel_down")

func _on_ray_cast_3d_metallbinder_clicked():
	metallbinder_count += 1
