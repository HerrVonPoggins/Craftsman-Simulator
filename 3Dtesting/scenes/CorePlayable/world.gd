extends Node3D

var mat1 = load("res://assets/textures/material_white.tres")
var counter = 0
var played = false
var diealogue_played = 0

#plays the animation to fade into the scene from the black screen
func _ready():
	Music._play_bricklayer()
	Global.ground_floor = $"Root Scene/RootNode/Bodenplatte_001/StaticBody3D".get_instance_id()
	Global.ground_grass = $Map/Boden/MapGround.get_instance_id()
	Global.current_scene = 1
	DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_intro.dialogue"))
	$Enter.play("fade_in")
	$Player.pointer = $Props/Trowel.global_position
	
	#when the wall is build the animation to fill in the remaining bricks and a praise dialogue is started
func _process(delta):

	
	
	if $Node3D5.visible == true or $Node3D7.visible == true or $Node3D8.visible == true or $Node3D9.visible == true:
		$Player.visible = false
	else:
		$Player.visible = true
	
	if Global.concrete_1 == true:
		$"Area3D2/mörtel".visible = true
	if Global.concrete_2 == true:
		$"Area3D3/mörtel".visible = true
	if Global.concrete_3 == true:
		$"Area3D4/mörtel".visible = true
	
	
	
	if Input.is_action_just_pressed("kamera"):
		pass
		
		
	if Global.tutorial_finished == true and counter == 0:
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_1.dialogue"))
		counter = 0.5
		
	if $StringWedge/MeshInstance3D.visible == true and $StringWedge2/MeshInstance3D.visible == true and Global.string == false:
		Music._play_string()
		$StringWedge/String.visible = true
		Global.string = true
		Global.isolation = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_3.dialogue"))
	
	
	if Global.wall_finished == true and played == false:
		played = true
		$"Root Scene/RootNode/geruest merged".visible = true
		#$house_anim_1.visible = true
		#$house_anim_1/AnimationPlayer.play("Scene")
		#await  $house_anim_1/AnimationPlayer.animation_finished

		#$house_anim_2.visible = true
		#$house_anim_2/AnimationPlayer.play("Scene")
		#await $house_anim_2/AnimationPlayer.animation_finished


		$"Root Scene/RootNode/Wand Unten_006/StaticBody3D/CollisionShape3D".call_deferred("set_disabled", false)
		$Doortop.visible = true
		$Doortop2.visible = true
		$Doortop3.visible = true
		$Doortop4.visible = true
		$Doortop5.visible = true
		$Doortop6.visible = true
		$Doortop7.visible = true
		$Doortop8.visible = true
		$Node3D.visible = true
		$Node3D3.visible = true
		$Node3D4.visible = true
		$"Root Scene/RootNode/geruest merged".visible = true
		played = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_4.dialogue"))
		
		if Global.door_top == 4 and Global.window_top == 0:
			DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/schlusstext.dialogue"))



#functions for the info hub to pause the scene
func _on_control_opened():
	get_tree().paused = true


func _on_control_closed():
	get_tree().paused = false

#if the trowel is carried through the bucket the concrete is "on it"
func _on_concrete_bucket_body_entered(body):
	if body.is_in_group("trowel"):
		Global.concrete = true
	if body.is_in_group("tool"):
		Global.concrete = true



func _on_string_wedge_body_entered(body):
	if body.is_in_group("wedge") and Global.concrete_mixed == true:
		body.queue_free()
		Music._play_wedge()
		$StringWedge/MeshInstance3D.visible = true
		$StringWedge/MeshInstance3D2.visible = false
		$StringWedge/CollisionShape3D.call_deferred("set_disabled", true)

func _on_string_wedge_2_body_entered(body):
	if body.is_in_group("wedge") and Global.concrete_mixed == true:
		body.queue_free()
		Music._play_wedge()
		$StringWedge2/MeshInstance3D.visible = true
		$StringWedge2/MeshInstance3D2.visible = false
		$StringWedge2/CollisionShape3D.call_deferred("set_disabled", true)


func _on_ray_cast_3d_start_saw_minigame():
	if Global.brick_sawed == false:
		$Saw/SawCamera.current = true
		Global.brick_saw_cam = true
		Global.stay = true
	

func _on_area_3d_2_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true:
		$Area3D2/CollisionShape3D.call_deferred("set_disabled", true)
		$Node3D5.visible = true


func _on_area_3d_3_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true and Global.concrete_1 == true:
		$Area3D3/CollisionShape3D.call_deferred("set_disabled", true)
		$Node3D7.visible = true


func _on_area_3d_4_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true and Global.concrete_2 == true:
		$Area3D4/CollisionShape3D.call_deferred("set_disabled", true)
		$Node3D8.visible = true


func _on_area_3d_5_body_entered(body):
	if body.is_in_group("spirit_level"):
		$Node3D9.visible = true
		


func _on_saw_camera_brick_cut_correct():
	$Saw/BrickCut.queue_free()
	Global.brick_sawed = true
	Global.brick_saw_cam = false
	$Props/Brick3.visible = true
	Global.stay = false
	$Player/CharacterBody3D/Neck/Camera3D.current = true






func _on_area_3d_body_entered(body):
	if body.is_in_group("concretebucket"):
		body.queue_free()
		$Area3D/Bucket_water2.queue_free()
		$Area3D/ConcreteBucketObj.visible = true


func _on_timer_timeout():
		if $Area3D/ConcreteBucketObj.visible == false:
			if $Area3D/Bucket_water2.visible == true:
				$Area3D/Bucket_water2.visible = false
			elif $Area3D/Bucket_water2.visible == false:
				$Area3D/Bucket_water2.visible = true

	
