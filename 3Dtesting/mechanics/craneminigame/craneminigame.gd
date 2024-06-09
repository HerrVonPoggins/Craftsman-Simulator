extends Node3D
var obj = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if obj != null:
		obj.global_transform = $CharacterBody3D/Area3D/Hold.global_transform

		if obj == $Decke1:
			$Area3D2/MeshInstance3D.visible = true



func _on_area_3d_2_body_entered(body):
	if body.is_in_group("roof1"):
		body.queue_free()
		$Area3D2/Decke1.visible = true
		$Area3D2/MeshInstance3D.queue_free()
		
		
		


func _on_area_3d_body_entered(body):
	if body.is_in_group("roof"):
		#body.linear_velocity = $CharacterBody3D/Area3D/Hold
		obj = body
