extends RayCast3D


#checks what body ground ist and returns its instance
#based on the ground the right sound is played and stops when not moving
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



