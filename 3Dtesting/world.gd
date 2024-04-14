extends Node3D


var beton = false


func _ready():
	$AnimationPlayer.play("fade_in")


#kamera switch zwischen iso cam und Firstperson cam und macht das fadenkreuz unsichtbar wenn in iso 
func _process(delta):
	if Input.is_action_just_pressed("kamera"):
		#DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/test.dialogue"))
		
		if $"Neck ISO/Camera3D ISO".current == true:
			$"Neck ISO/Camera3D ISO".current = false
			$"CharacterBody3D/Neck FP/Camera3D FP/TextureRect".visible = true
			Global.perspective = 1
		else:
			$"Neck ISO/Camera3D ISO".current = true
			$"CharacterBody3D/Neck FP/Camera3D FP/TextureRect".visible = false
			Global.perspective = 0
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		


#methoden sodass wenn maus über den body hovern dann wird der highlighter sichtbar
func _on_rigid_body_3d_2_mouse_entered():
	$RigidBody3D2/CollisionShape3D/MeshInstance3D.visible = true


func _on_rigid_body_3d_2_mouse_exited():
	$RigidBody3D2/CollisionShape3D/MeshInstance3D.visible = false


func _on_control_opened():
	get_tree().paused = true


func _on_control_closed():
	get_tree().paused = false


func _on_rigid_body_3d_7_body_entered(body):
	if body.is_in_group("tool"):
		beton = true


func _on_säge_body_entered(body):
	if body.is_in_group("cut"):
		$RigidBodycut.scale = Vector3(1,1,0.5)
		$RigidBodycut/MeshInstance3D2.scale = Vector3(1,1,0.5)
		$RigidBodycut/CollisionShape3D.scale = Vector3(1,1,0.5)
		Global.brick_sawed = true
