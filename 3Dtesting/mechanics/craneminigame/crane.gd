extends CharacterBody3D

var played = false
var SPEED = 0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _process(delta):
	if Global.start_crane_game == true and played == false:
		
		$"..".visible = true
		$"../Camera3D".current = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_7.dialogue"))
		Global.stay = true
		Global.crosshair_off = true
		Global.crane_on = false
		played = true
		SPEED = 20




	if Input.is_action_just_pressed("interagieren") and $"..".visible == true:
		$"../AnimationPlayer".play("crane_down")
		await $"../AnimationPlayer".animation_finished
		$"../AnimationPlayer".play_backwards("crane_down")

func _physics_process(delta):
	# Add the gravity.
	if  $".".visible == true:
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir = Input.get_vector("left", "right", "forward", "back")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

		move_and_slide()



