extends Node3D
var generator_on = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.current_scene = 3
	Global.walking_on = $"Map/map/Boden modified/StaticBody3D"
	$Enter.play("fade_in")
	Global.ground_grass = $"Map/map/Boden modified/StaticBody3D".get_instance_id()
	#Global.ground_floor = 

func _on_control_opened():
	get_tree().paused = true


func _on_control_closed():
	get_tree().paused = false


func _process(delta):
	
	
	
	if generator_on == 4:
		$Transition._change_scene("res://UI/screens/endscreen.tscn")








