extends CharacterBody3D
#
#var played = false
#var SPEED = 0
#const JUMP_VELOCITY = 4.5
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
#
#func _process(delta):
	#$".".rotation_degrees.y = -($"..".rotation_degrees.y)
	#if Global.start_crane_game == true and played == false:
		#
		#$"../../../../..".visible = true
		#$"../../../../../Camera3D".current = true
		#DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_7.dialogue"))
		#Global.stay = true
		#Global.crosshair_off = true
		#Global.crane_on = false
		#played = true
		#SPEED = 20
#
	#if Input.is_action_just_pressed("interagieren") and $"../../../../..".visible == true:
		#$"../../../../../AnimationPlayer".play("crane_down")
		#await $"../../../../../AnimationPlayer".animation_finished
		#$"../../../../../AnimationPlayer".play_backwards("crane_down")
#
#func _physics_process(delta):
	### Add the gravity.
	#if  $".".visible == true:
		#if Input.is_action_pressed("left"):
			#$"../..".rotation_degrees.z += 0.1
		#if Input.is_action_pressed("right"):
			#$"../..".rotation_degrees.z -= 0.1
		#if Input.is_action_pressed("forward"):
			#$"..".rotation_degrees.y += 0.1
		#if Input.is_action_pressed("back"):
			#$"..".rotation_degrees.y -= 0.1