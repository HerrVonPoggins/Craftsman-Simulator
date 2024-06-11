extends RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_collider() != null:
		Global.walking_on = get_collider()

	if Global.is_walking == true:
		if Global.walking_on.get_instance_id() == Global.ground_grass:
			Music._play_walk_floor()
			if Global.walking_on.get_instance_id() != Global.ground_grass:
				Music._stop_walk_floor()
				
			
		if Global.walking_on.get_instance_id() == Global.ground_floor:
			Music._play_walk_grass()
			if Global.walking_on.get_instance_id() != Global.ground_floor:
				Music._stop_walk_grass()

	if Global.is_walking == false:
		Music._stop_walk_floor()
		Music._stop_walk_grass()
		Global.walk_sound_started = false



