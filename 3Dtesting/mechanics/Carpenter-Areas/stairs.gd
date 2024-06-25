extends Node3D

signal dübel_minigame_finished

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
			$"CameraStand/CameraDübel".position.x -= 2 * delta
		if Input.is_action_pressed("right"):
			$"CameraStand/CameraDübel".position.x += 2 * delta
		if Input.is_action_pressed("back"):
			$"CameraStand/CameraDübel".position.y -= 2 * delta
		if Input.is_action_pressed("forward"):
			$"CameraStand/CameraDübel".position.y += 2 * delta
	
	if dübel_amount_2 >= 28:
		emit_signal("dübel_minigame_finished")
		dübel_amount_2 = 0


func _on_area_3d_body_entered(body):
	if body.is_in_group("wallguide"):
		body.queue_free()
		$Wallguide.visible = true
		$"CameraStand/CameraDübel".current = true
		$"DübelContainer".visible = true
		Global.switch_minigame_on = true
		Global.stay = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

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
				await  animation_player.animation_finished
				$"DübelContainer/Dübel/Outline".queue_free()

func _on_dübel_2_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel2")
				dübel_amount_1 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel2/Outline2".queue_free()

func _on_dübel_3_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel3")
				dübel_amount_1 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel3/Outline3".queue_free()

func _on_dübel_4_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel4")
				dübel_amount_1 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel4/Outline4".queue_free()

func _on_dübel_5_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel5")
				dübel_amount_1 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel5/Outline5".queue_free()

func _on_dübel_6_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel6")
				dübel_amount_1 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel6/Outline6".queue_free()

var dübel_amount_2 = 6
func _on_dübel_7_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel7")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel7/Outline7".queue_free()

func _on_dübel_8_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel8")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel8/Outline8".queue_free()


func _on_dübel_9_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel9")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel9/Outline9".queue_free()


func _on_dübel_10_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel10")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel10/Outline10".queue_free()


func _on_dübel_11_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel11")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel11/Outline11".queue_free()


func _on_dübel_12_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel12")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel12/Outline12".queue_free()


func _on_dübel_13_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel13")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel13/Outline13".queue_free()


func _on_dübel_14_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel14")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel14/Outline14".queue_free()


func _on_dübel_15_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel15")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel15/Outline15".queue_free()


func _on_dübel_16_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel16")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel16/Outline16".queue_free()


func _on_dübel_17_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel17")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel17/Outline17".queue_free()


func _on_dübel_18_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel18")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel18/Outline18".queue_free()


func _on_dübel_19_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel19")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel19/Outline19".queue_free()


func _on_dübel_20_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel20")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel20/Outline20".queue_free()


func _on_dübel_21_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel21")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel21/Outline21".queue_free()


func _on_dübel_22_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel22")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel22/Outline22".queue_free()


func _on_dübel_23_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel23")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel23/Outline23".queue_free()


func _on_dübel_24_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel24")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel24/Outline24".queue_free()


func _on_dübel_25_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel25")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel25/Outline25".queue_free()


func _on_dübel_26_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel26")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel26/Outline26".queue_free()


func _on_dübel_27_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel27")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel27/Outline27".queue_free()


func _on_dübel_28_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				animation_player.play("Dübel28")
				dübel_amount_2 += 1
				await  animation_player.animation_finished
				$"DübelContainer/Dübel28/Outline28".queue_free()
