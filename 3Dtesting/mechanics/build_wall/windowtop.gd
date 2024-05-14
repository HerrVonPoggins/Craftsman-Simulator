extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.is_in_group("window") :
		body.queue_free()
		$Area3D/CollisionShape3D.call_deferred("set_disabled", true)
		$Area3D/MeshInstance3D.visible = true
		$Area3D/MeshInstance3D2.visible = false
		
	if $Area3D/MeshInstance3D.visible == true and body.is_in_group("trowel") and Global.concrete == true and Global.wall_finished == true:
		if $MeshInstance3D.visible == false:
			$MeshInstance3D.visible = true
		else:
			$MeshInstance3D2.visible = true
			Global.concrete = false
			Global.window_top += 1
			
