extends RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_collider() != null:
		Global.walking_on = get_collider()

	if Input.is_action_just_pressed("kamera"):
		
		#print(Global.walking_on)
		print(Global.walking_on.get_instance_id())

