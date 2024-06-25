extends Node3D

@onready var animation_player = $AnimationPlayer
var placed_step_counter = 0
var camera_rotated = false

func _process(delta):
	if dübel_amount_1 >= 6:
		await get_tree().create_timer(1).timeout
		animation_player.play("Camera1")
		dübel_amount_1 = 0
		camera_rotated = true
	
	if camera_rotated == true:
		if Input.is_action_pressed("left"):
			$CameraStand/Camera1.position.x -= 2 * delta
		if Input.is_action_pressed("right"):
			$CameraStand/Camera1.position.x += 2 * delta
		if Input.is_action_pressed("back"):
			$CameraStand/Camera1.position.y -= 2 * delta
		if Input.is_action_pressed("forward"):
			$CameraStand/Camera1.position.y += 2 * delta


func _on_area_3d_body_entered(body):
	if body.is_in_group("wallguide"):
		body.queue_free()
		$Wallguide.visible = true
		$CameraStand/Camera1.current = true
		$"DübelContainer".visible = true
	if body.is_in_group("step"):
		body.queue_free()
		placed_step_counter += 1
		if placed_step_counter == 1:
			$Step1.visible = true
		if placed_step_counter == 2:
			$Step2.visible = true
		if placed_step_counter == 3:
			$Step3.visible = true
		if placed_step_counter == 4:
			$Step4.visible = true
		if placed_step_counter == 5:
			$Step5.visible = true
		if placed_step_counter == 6:
			$Step6.visible = true
		if placed_step_counter == 7:
			$Step7.visible = true
		if placed_step_counter == 8:
			$Step8.visible = true

var dübel_amount_1 = 0
func _on_dübel_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel1")
				dübel_amount_1 += 1

func _on_dübel_2_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel2")
				dübel_amount_1 += 1

func _on_dübel_3_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel3")
				dübel_amount_1 += 1

func _on_dübel_4_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel4")
				dübel_amount_1 += 1

func _on_dübel_5_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel5")
				dübel_amount_1 += 1

func _on_dübel_6_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel6")
				dübel_amount_1 += 1

var dübel_amount_2 = 6
func _on_dübel_7_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel7")
				dübel_amount_2 += 1

func _on_dübel_8_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel8")
				dübel_amount_2 += 1


func _on_dübel_9_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel9")
				dübel_amount_2 += 1
