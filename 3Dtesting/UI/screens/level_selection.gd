extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Enter.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$Transition._change_scene("res://scenes/CorePlayable/CorePlayable.tscn")


func _on_button_2_pressed():
	$Transition._change_scene("res://scenes/Carpenter/carpenter_world.tscn")


func _on_button_3_pressed():
	$Transition._change_scene("res://scenes/ElektrikerScene/Elektriker.tscn")


func _on_button_4_pressed():
	$Transition._change_scene("res://UI/screens/titlescreen.tscn")
