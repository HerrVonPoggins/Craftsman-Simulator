extends Node3D

var placed_step_counter = 0

func _on_area_3d_body_entered(body):
	if body.is_in_group("wallguide"):
		body.queue_free()
		$Wallguide.visible = true
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
	
