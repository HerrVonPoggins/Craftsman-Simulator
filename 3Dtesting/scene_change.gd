extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Enter.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if Global.current_scene == 1:
		$Transition._change_scene("res://scenes/Carpenter/carpenter_world.tscn")
	elif Global.current_scene == 2:
		$Transition._change_scene("res://scenes/ElektrikerScene/Elektriker.tscn")
