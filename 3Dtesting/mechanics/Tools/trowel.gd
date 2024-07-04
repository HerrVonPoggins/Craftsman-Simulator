extends RigidBody3D


#trowel switches model when concrete is on it
func _process(delta):
	if Global.concrete == true:
		$"Kelle Groß".visible = true
		$"Mesh".visible = false
	else:
		$"Kelle Groß".visible = false
		$"Mesh".visible = true
	if Global.plaster_on == true:
		$"Kelle Gips".visible = true
		$"Mesh".visible = false
	else:
		$"Kelle Gips".visible = false
		$"Mesh".visible = true
