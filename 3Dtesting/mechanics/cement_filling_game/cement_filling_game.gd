extends Node3D

var cement_filled = false

func _process(delta):
	if $AnimationPlayer.get_current_animation_position() >= 0.8 and cement_filled == false:
		$MeshInstance3D.mesh.size.y += 0.25 * delta
	if $MeshInstance3D.mesh.size.y >= 0.5:
		$MeshInstance3D.mesh.size.y = 0.5
		cement_filled = true
		
