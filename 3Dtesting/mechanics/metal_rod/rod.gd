extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_string_wedge_body_entered(body):
	if body.is_in_group("rod") and $".".visible == true:
		body.queue_free()
		Global.rods += 1
		$StringWedge/Mesh.visible = true
		$StringWedge/CollisionShape3D.call_deferred("set_disabled", true)
		$StringWedge/MeshInstance3D2.queue_free()
