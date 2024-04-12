extends Node2D

#scene transition
func _ready():
	$AnimationPlayer.play("fade_in")
	
#wechselt die szene zurück zum titlescreen
func _on_button_pressed():
	$transition.change_scene("res://UI/titlescreen.tscn")
