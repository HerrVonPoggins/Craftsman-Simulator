extends Node3D

var doors_done = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Enter.play("fade_in")
	Global.current_scene = 2
	Global.walking_on = $"Map/map/Boden modified/StaticBody3D"
	#$Enter.play("fade_in")
	Global.ground_grass = $"Map/map/Boden modified/StaticBody3D".get_instance_id()

func _on_stairs_dübel_minigame_finished():
	$Player/CharacterBody3D/Neck/Camera3D.current = true
	Global.stay = false
	Global.switch_minigame_on = false
	$Player.visible = true


func _on_stairs_player_visibility_off():
	$Player.visible = false

func _on_control_opened():
	get_tree().paused = true


func _on_control_closed():
	get_tree().paused = false



func _process(delta):
	if doors_done == 7:
		$Transition._change_scene("res://UI/screens/scene_change.tscn")
