extends Node2D


#knöpfe für den titlescreen

func _ready():
	$AnimationPlayer.play("fade_in")


func _on_button_pressed():
	$transition.change_scene("res://scenes/CorePlayable/CorePlayable.tscn")


func _on_button_2_pressed():
	$transition.change_scene("res://UI/credits.tscn")



func _on_button_3_pressed():
	get_tree().quit()
