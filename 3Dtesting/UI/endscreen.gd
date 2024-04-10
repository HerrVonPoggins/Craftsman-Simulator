extends Node2D



#wechselt die szene zurück zum titlescreen

func _on_button_pressed():
	$transition.change_scene("res://UI/titlescreen.tscn")
