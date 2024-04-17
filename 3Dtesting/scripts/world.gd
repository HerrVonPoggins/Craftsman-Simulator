extends Node3D


var beton = false
var saw_is_on = false
var counter = 0

func _ready():
	$AnimationPlayer.play("fade_in")


func _process(delta):
	var played = false
	if Global.wall_finished == true and played == false:
		$bricks.visible = true
		$AnimationPlayer2.play("brick_build")
		played = true
		



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




func _on_area_3d_body_entered(body):
	
	if body.is_in_group("isolation"):
		body.queue_free()
		
		if $Haus_Grundriss_001.visible == false and counter == 0:
			$Haus_Grundriss_001.visible = true
			counter = 1
		elif $Haus_Grundriss_001.visible == true and counter == 1:
			$Haus_Grundriss_002.visible = true
			counter = 2
		elif $Haus_Grundriss_002.visible == true and counter == 2:
			$Haus_Grundriss_003.visible = true
			Global.isolation = true




#func _on_rigid_body_3d_4_body_entered(body):
	#if body.is_in_group("brick"):
		#print("yes")
		#var joint = PinJoint2D.new()
		#joint.node_a = self
		#joint.node_b = body
		#joint.anchor_a = Vector2.ZERO
		#joint.anchor_b = Vector2.ZERO
		#get_parent().add_child(joint)
