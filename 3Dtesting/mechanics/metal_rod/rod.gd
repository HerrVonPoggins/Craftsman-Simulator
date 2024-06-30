extends Node3D

func _process(delta):
	if Global.rods == 19:
		$StaticBody3D/Mesh.visible = true
		$StaticBody3D.scale = Vector3(1,1.35,1)
		if $StringWedge/MeshInstance3D2 != null:
			$StringWedge/MeshInstance3D2.visible = false
#when rod is put in area the rod is placed
func _on_string_wedge_body_entered(body):
	if body.is_in_group("rod") and $".".visible == true:
		body.queue_free()
		Global.is_holding = false
		Global.can_extend = false
		Music._play_concrete_placing()
		Global.rods += 1
		$StaticBody3D/Mesh.visible = true
		$StaticBody3D/CollisionShape3D2.call_deferred("set_disabled", false)
		$StringWedge/CollisionShape3D.call_deferred("set_disabled", true)
		$StringWedge/MeshInstance3D2.queue_free()
