extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Area3D2/MeshInstance3D.visible == true and $Area3D3/MeshInstance3D2.visible == true:
		Global.door_top += 1
		Global.concrete = false


func _on_area_3d_body_entered(body):
	if body.is_in_group("lintel") and Global.wall_finished == true :
		 #
		body.queue_free()
		$Area3D/CollisionShape3D.call_deferred("set_disabled", true)
		$Area3D/MeshInstance3D.visible = true
		$Area3D/MeshInstance3D2.visible = false




func _on_area_3d_2_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true and Global.wall_finished == true:
		if $Area3D/MeshInstance3D.visible == true:
			$Area3D2/MeshInstance3D.visible = true


func _on_area_3d_3_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true and Global.wall_finished == true:
		if $Area3D/MeshInstance3D.visible == true:
			$Area3D3/MeshInstance3D2.visible = true
