extends Node3D

var done = false
@onready var window_lintel_brick = $Lintel/Brick
@onready var window_lintel_outline = $Lintel/Outline



#window lintel old with placing concrete better use Doortop

func _process(delta):
	if $Area3D2/MeshInstance3D.visible == true and $Area3D3/MeshInstance3D2.visible == true and done == false:
		Global.window_top += 1
		Global.concrete = false
		done = true


func _on_area_3d_body_entered(body):
	if body.is_in_group("window") and Global.wall_finished == true:
		body.queue_free()
		$Lintel/CollisionShape3D.call_deferred("set_disabled", true)
		window_lintel_brick.visible = true
		window_lintel_outline.visible = false
		


func _on_area_3d_2_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true and Global.wall_finished == true:
		if window_lintel_brick.visible == true:
			$Area3D2/MeshInstance3D.visible = true


func _on_area_3d_3_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true and Global.wall_finished == true:
		if window_lintel_brick.visible == true:
			$Area3D3/MeshInstance3D2.visible = true
