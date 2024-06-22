extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.current_scene = 3
	Global.walking_on = $"Map/map/Boden modified/StaticBody3D"
	$Enter.play("fade_in")
	Global.ground_grass = $"Map/map/Boden modified/StaticBody3D".get_instance_id()
	#Global.ground_floor = 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("kamera"):
		pass


func _on_control_opened():
	get_tree().paused = true


func _on_control_closed():
	get_tree().paused = false


func _on_stand_still_body_entered(body):
	if body.is_in_group("player"):
		Global.stay = true

