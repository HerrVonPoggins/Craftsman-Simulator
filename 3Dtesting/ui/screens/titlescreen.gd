extends Node2D


#titlescreen to switch between scenes

func _ready():
	$AnimationPlayer.play("fade_in")
	$AnimationPlayer.play("Logo")
	
	if Global.current_scene != -1:
		Music._play_main_menu()
	Global.current_scene = 0

func _on_button_start_pressed():
	Music._play_button()
	Music._stop_main_menu()
	$Transition._change_scene("res://scenes/CorePlayable/CorePlayable.tscn")

func _on_button_credits_pressed():
	Music._play_button()
	$Transition._change_scene("res://ui/screens/credits.tscn")

func _on_button_quit_pressed():
	get_tree().quit()


func _on_button_start_mouse_entered():
	$StartPlayer.play("Start_hover")


func _on_button_quit_mouse_entered():
	$QuitPlayer.play("Quit_hover")


func _on_button_start_mouse_exited():
	$StartPlayer.play("Start_quit")


func _on_button_quit_mouse_exited():
	$QuitPlayer.play("Quit_exit")
