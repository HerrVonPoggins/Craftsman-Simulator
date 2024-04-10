extends Node2D


#knöpfe für den titlescreen


func _on_button_pressed():
	$transition.change_scene("res://area.tscn")


func _on_button_2_pressed():
	$transition.change_scene("res://UI/credits.tscn")



func _on_button_3_pressed():
	get_tree().quit()
