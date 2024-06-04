extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("escape"):
		$".".visible = false


func _on_button_pressed():
	Music._play_button()
	$".".visible = false






func _on_volume_scrolling():
	Music.volume = $Volume.value
	print(Music.volume)


func _on_mouse_sens_scrolling():
	Global.mouse_sensitivity = $MouseSens.value


func _on_volume_2_scrolling():
	Music.effects = $Volume2.value


func _on_button_2_pressed():
	$Volume.value -= 20


func _on_button_3_pressed():
	$Volume2.value -= 20


func _on_button_4_pressed():
	$MouseSens.value -= 10


func _on_button_5_pressed():
	$Volume.value += 20


func _on_button_6_pressed():
	$Volume2.value += 20


func _on_button_7_pressed():
	$MouseSens.value += 10


func _on_check_button_toggled(toggled_on):

	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
