extends CharacterBody3D

const SPEED = 5.0

func _process(delta):
	var current_position
	if Input.is_action_pressed("interagieren") and $"..".visible == true:
		$"../AnimationPlayer".play("crane_down")
		current_position = $"../AnimationPlayer".get_current_animation_position()
		if current_position >= 0.8:
			$"../AnimationPlayer".set_speed_scale(0)

	if Input.is_action_just_released("interagieren") and $"..".visible == true:
		$"../AnimationPlayer".set_speed_scale(1)
		$"../AnimationPlayer".play_backwards("crane_down")

func _physics_process(delta):
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
