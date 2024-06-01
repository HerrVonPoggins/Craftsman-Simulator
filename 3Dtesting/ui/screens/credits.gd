extends Node2D

#scene transition
func _ready():
	Global.current_scene = -1
	$AnimationPlayer.play("fade_in")
	
#change back to titlescreen
func _on_button_pressed():
	Music._play_button()
	$transition._change_scene("res://ui/screens/titlescreen.tscn")
	
