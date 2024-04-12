extends Node2D

var level = preload("res://area.tscn")
#knöpfe für den titlescreen


func _on_button_pressed():
	$transition.change_scene(level)


func _on_button_2_pressed():
	$transition.change_scene("res://UI/credits.tscn")



func _on_button_3_pressed():
	get_tree().quit()
