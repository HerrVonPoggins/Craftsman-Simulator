extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Enter.play("fade_in")
	Global.current_scene = 2
	Global.walking_on = $"Map/map/Boden modified/StaticBody3D"
	#$Enter.play("fade_in")
	Global.ground_grass = $"Map/map/Boden modified/StaticBody3D".get_instance_id()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
