extends Node3D
var done = false
var is_up = false

@onready var player_1 = $"Root Scene4/AnimationPlayer"
@onready var player_2 = $"Root Scene4/AnimationPlayer2"
@onready var platform = $"Root Scene"

#starts the game when visible
func _process(delta):
	if $".".visible == true and Global.filler_started == true:
		$Camera3D.current = true
		Global.stay = true
		$"Root Scene4/RootNode".visible = true
		Global.crosshair_off = true
		Global.player_visibility = false


	if Input.is_action_pressed("leftclick") and $".".visible == true and done == false:
		player_1.play("Cylinder|CylinderAction")
		player_2.play("Icosphere_001|IcosphereAction_001")
		platform.position.y += 0.002
		
	if Input.is_action_just_released("leftclick") and $".".visible == true:
		player_1.stop()
		player_2.stop()

	if platform.position.y >= -16.15:
		done = true
		Global.concrete_filled_roof = true
		Global.stay = false
		Global.crosshair_off = false
		Global.player_visibility = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/schlusstext.dialogue"))
		queue_free()
