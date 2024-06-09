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

	#if Global.walking_on.get_instance_id() != 72444021493:
		#Music._stop_walk_grass()
#
	#if Global.walking_on.get_instance_id() != 71890373332:
		#Music._stop_walk_floor()


	#if Global.swap_grass == true:
		#Input.action_press("forward")
		#Global.swap_grass = false
	#if Global.swap_floor == true:
		#Input.action_press("forward")
		#Global.swap_floor = false
		

	#if Input.is_action_just_pressed("kamera"):
		#print(Global.is_walking)
		#print(Global.walking_on.get_instance_id())
		#print(Global.ground_grass)

