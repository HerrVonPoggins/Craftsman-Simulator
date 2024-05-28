extends RayCast3D

var obj = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("leftclick"):
		var collider = get_collider()
		

		if collider != null:
			if collider.is_in_group("circuit"):
				print(collider.rotation)
				collider.rotate_z(deg_to_rad(90.0))
