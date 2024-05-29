extends RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.walking_on = get_collider()

	if Input.is_action_just_pressed("kamera"):
		print(Global.walking_on)
		Music._play_walk_grass()
