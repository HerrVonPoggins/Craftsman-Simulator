extends Node3D
var done = false
var is_up = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $".".visible == true:
		$Camera3D.current = true


	if Input.is_action_pressed("leftclick") and $".".visible == true and done == false:
		$"Root Scene4/AnimationPlayer".play("Cylinder|CylinderAction")
		$"Root Scene4/AnimationPlayer2".play("Icosphere_001|IcosphereAction_001")
		$"Root Scene".position.y += 0.002
		
	if Input.is_action_just_released("leftclick") and $".".visible == true:
		$"Root Scene4/AnimationPlayer".stop()
		$"Root Scene4/AnimationPlayer2".stop()

	if $"Root Scene".position.y >= -16.15:
		done = true
		Global.concrete_filled_roof = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/schlusstext.dialogue"))
		queue_free()
