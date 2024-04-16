extends Node3D


var beton = false


func _ready():
	$AnimationPlayer.play("fade_in")






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
		Global.concrete = true


func _on_säge_body_entered(body):
	if body.is_in_group("cut"):
		$RigidBodycut.scale = Vector3(1,1,0.5)
		$RigidBodycut/MeshInstance3D2.scale = Vector3(1,1,0.5)
		$RigidBodycut/CollisionShape3D.scale = Vector3(1,1,0.5)
		Global.brick_sawed = true


func _on_concrete_bucket_body_entered(body):
	if body.is_in_group("trowel"):
		Global.concrete = true
