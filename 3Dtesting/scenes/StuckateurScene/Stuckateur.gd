extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Enter.play("fade_in")
	Global.current_scene = 2
	$CanvasLayer/Control.check.label_text_1 = "Staenderwand bauen"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#functions for the info hub to pause the scene
func _on_control_opened():
	get_tree().paused = true


func _on_control_closed():
	get_tree().paused = false
