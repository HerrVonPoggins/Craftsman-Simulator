extends Node3D



#eine area3d die wenn ein körper aus der gruppe brick entered das object entfernt und einen ziegel sichtbar macht

func _on_area_3d_body_entered(body):
	if body.is_in_group("brick") == true:
		
		if $MeshInstance3D.visible == false and body.is_in_group("cut") == false:
			body.queue_free()
			$MeshInstance3D.visible = true
			$Area3D/MeshInstance3D6.visible = false
			$Area3D/MeshInstance3D.visible = true
		elif$MeshInstance3D2.visible == false and body.is_in_group("cut") == false:
			body.queue_free()
			$MeshInstance3D2.visible = true
			$Area3D/MeshInstance3D.visible = false
			$Area3D/MeshInstance3D2.visible = true
		elif$MeshInstance3D3.visible == false and body.is_in_group("cut") == false:
			body.queue_free()
			$MeshInstance3D3.visible = true
			$Area3D/MeshInstance3D2.visible = false
			$Area3D/MeshInstance3D3.visible = true
		elif$MeshInstance3D4.visible == false and body.is_in_group("cut") == false:
			body.queue_free()
			$MeshInstance3D4.visible = true
			$Area3D/MeshInstance3D3.visible = false
			$Area3D/MeshInstance3D7.visible = true
		elif $MeshInstance3D5.visible == false and body.is_in_group("cut") and $Area3D/MeshInstance3D7.visible == true:
			body.queue_free()
			$MeshInstance3D5.visible = true
			$Area3D/MeshInstance3D7.visible = false
			Global.wall_finished = true
			DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/schlusstext.dialogue"))
