extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Enter.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	Music._stop_main_menu()
	$Transition._change_scene("res://scenes/CorePlayable/CorePlayable.tscn")


func _on_button_2_pressed():
	Music._stop_main_menu()
	$Transition._change_scene("res://scenes/Carpenter/carpenter_world.tscn")


func _on_button_3_pressed():
	Music._stop_main_menu()
	$Transition._change_scene("res://scenes/ElektrikerScene/Elektriker.tscn")


func _on_button_4_pressed():
	$Transition._change_scene("res://UI/screens/titlescreen.tscn")


func _on_button_mouse_entered():
	$Level_1.play("Level_1_Enter")


func _on_button_mouse_exited():
	$Level_1.play("Level_1_Exit")


func _on_button_2_mouse_entered():
	$Level_2.play("Level_2_Enter")


func _on_button_2_mouse_exited():
	$Level_2.play("Level_2_Exit")


func _on_button_3_mouse_entered():
	$Level_3.play("Level_3_Enter")


func _on_button_3_mouse_exited():
	$Level_3.play("Level_3_Exit")


func _on_button_4_mouse_entered():
	$Level_3.play("ExitButton_Enter")


func _on_button_4_mouse_exited():
	$Level_3.play("ExitButton_Exit")
