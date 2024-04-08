extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("kamera"):
		if $"Neck ISO/Camera3D ISO".current == true:
			$"Neck ISO/Camera3D ISO".current = false
		else:
			$"Neck ISO/Camera3D ISO".current = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		



func _on_rigid_body_3d_2_mouse_entered():
	$RigidBody3D2/CollisionShape3D/MeshInstance3D.visible = true


func _on_rigid_body_3d_2_mouse_exited():
	$RigidBody3D2/CollisionShape3D/MeshInstance3D.visible = false
