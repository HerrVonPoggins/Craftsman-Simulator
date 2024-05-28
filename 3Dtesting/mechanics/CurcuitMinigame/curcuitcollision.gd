extends RayCast3D

var obj = null
var done = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"../../../StaticBody3D2".rotation_degrees.x == -40 and done == false:
		$"../../../Node3D".rotate_z(deg_to_rad(20))

	elif $"../../../StaticBody3D2".rotation_degrees.x == 20:
		$"../../../Node3D".rotate_z(deg_to_rad(-20))


	if $"../../../StaticBody3D3".rotation_degrees.x == -40:
		$"../../../Node3D".rotate_z(deg_to_rad(20))

	elif $"../../../StaticBody3D3".rotation_degrees.x == 20:
		$"../../../Node3D".rotate_z(deg_to_rad(-20))


	if $"../../../StaticBody3D4".rotation_degrees.x == -40:
		$"../../../Node3D".rotate_z(deg_to_rad(20))

	elif $"../../../StaticBody3D4".rotation_degrees.x == 20:
		$"../../../Node3D".rotate_z(deg_to_rad(-20))


	if $"../../../StaticBody3D5".rotation_degrees.x == -40:
		$"../../../Node3D".rotate_z(deg_to_rad(20))

	elif $"../../../StaticBody3D5".rotation_degrees.x == 20:
		$"../../../Node3D".rotate_z(deg_to_rad(-20))





	
	if Input.is_action_just_pressed("leftclick"):
		var collider = get_collider()


		if collider != null:
			if collider.is_in_group("circuit"):

				collider.rotate_z(deg_to_rad(90.0))
			if collider.is_in_group("switch"):
				if collider.rotation.x >= 0:
					collider.rotation.x = deg_to_rad(-40)
				else:
					collider.rotation.x = deg_to_rad(20)


	if Input.is_action_just_pressed("kamera"):
		print($"../../../StaticBody3D3".rotation_degrees.x)
