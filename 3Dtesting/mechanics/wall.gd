extends Node3D


var counter = 0
#eine area3d die wenn ein körper aus der gruppe brick entered das object entfernt und einen ziegel sichtbar macht

func _on_area_3d_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true:
		if counter == 0:
			$Area3D/MeshInstance3D4.visible = true
			Global.concrete = false
			counter = 1
	elif $Area3D/MeshInstance3D4.visible == true and counter == 1 and $MeshInstance3D.visible == true and Global.concrete == true:
		$Area3D/MeshInstance3D5.visible = true
		Global.concrete = false
		counter = 2
	elif $Area3D/MeshInstance3D5.visible == true and counter == 2 and $MeshInstance3D2.visible == true and Global.concrete == true:
		$Area3D/MeshInstance3D8.visible = true
		Global.concrete = false
		counter = 3
	elif $Area3D/MeshInstance3D8.visible == true and counter == 3 and $MeshInstance3D3.visible == true and Global.concrete == true:
		$Area3D/MeshInstance3D9.visible = true
		Global.concrete = false
		counter = 4
	elif $Area3D/MeshInstance3D9.visible == true and counter == 4 and $MeshInstance3D4.visible == true and Global.concrete == true:
		$Area3D/MeshInstance3D10.visible = true
		Global.concrete = false
	
	if body.is_in_group("brick") == true:
		
		if $MeshInstance3D.visible == false and body.is_in_group("cut") == false and $Area3D/MeshInstance3D4.visible == true and counter == 1 :
			body.queue_free()
			$MeshInstance3D.visible = true
			$Area3D/MeshInstance3D6.visible = false
			$Area3D/MeshInstance3D.visible = true
			
		elif$MeshInstance3D2.visible == false and body.is_in_group("cut") == false and $Area3D/MeshInstance3D5.visible == true and counter == 2:
			body.queue_free()
			$MeshInstance3D2.visible = true
			$Area3D/MeshInstance3D.visible = false
			$Area3D/MeshInstance3D2.visible = true

		elif$MeshInstance3D3.visible == false and body.is_in_group("cut") == false and $Area3D/MeshInstance3D8.visible == true and counter ==3:
			body.queue_free()
			$MeshInstance3D3.visible = true
			$Area3D/MeshInstance3D2.visible = false
			$Area3D/MeshInstance3D3.visible = true

		elif$MeshInstance3D4.visible == false and body.is_in_group("cut") == false and $Area3D/MeshInstance3D9.visible == true and counter == 4:
			body.queue_free()
			$MeshInstance3D4.visible = true
			$Area3D/MeshInstance3D3.visible = false
			$Area3D/MeshInstance3D7.visible = true

		elif $MeshInstance3D5.visible == false and body.is_in_group("cut") and $Area3D/MeshInstance3D7.visible == true and $Area3D/MeshInstance3D10.visible == true:
			body.queue_free()
			$MeshInstance3D5.visible = true
			$Area3D/MeshInstance3D7.visible = false
			Global.wall_finished = true

			DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/schlusstext.dialogue"))

func _process(delta):
	if Input.is_action_just_pressed("kamera"):
		print(counter)
