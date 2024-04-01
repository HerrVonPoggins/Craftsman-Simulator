extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.is_in_group("brick") == true:
		body.queue_free()
		if $MeshInstance3D.visible == false:
			$MeshInstance3D.visible = true
		elif$MeshInstance3D2.visible == false:
			$MeshInstance3D2.visible = true
		elif$MeshInstance3D3.visible == false:
			$MeshInstance3D3.visible = true
		elif$MeshInstance3D4.visible == false:
			$MeshInstance3D4.visible = true
		elif$MeshInstance3D5.visible == false:
			$MeshInstance3D5.visible = true
