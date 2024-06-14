extends Control


func _ready():
	_check_sens()
	_check_music()
	_check_sound()


func _check_sens():
	var button_container = $SensivityContainer
	for i in range(button_container.get_child_count()):
		var button = button_container.get_child(i)
		if i < Global.mouse_sense:
			button.visible = true
		else:
			button.visible = false

func _check_music():
	var button_container = $MusicContainer
	for i in range(button_container.get_child_count()):
		var button = button_container.get_child(i)
		if i < Global.musik_count:
			button.visible = true
		else:
			button.visible = false

func _check_sound():
	var button_container = $SoundContainer
	for i in range(button_container.get_child_count()):
		var button = button_container.get_child(i)
		if i < Global.sound_count:
			button.visible = true
		else:
			button.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("escape"):
		$".".visible = false



func _on_button_pressed():
	Music._play_button()
	$SettingsPlayer.play("exit_menu")
	$ExitTimer.start()


func _on_music_minus_button_pressed():
	$SettingsPlayer.play("music_minus")
	if Global.musik_count == 1:
		pass
	else:
		Global.musik_count -= 1
		_check_music()
		Music.volume -= 5
		$Volume.value -= 20

func _on_music_plus_button_pressed():
	$SettingsPlayer.play("music_plus")
	if Global.musik_count == 12:
		pass
	else:
		Global.musik_count += 1
		_check_music()
		Music.volume += 5
		$Volume.value += 20

func _on_sound_minus_button_pressed():
	$SettingsPlayer.play("sound_minus")
	if Global.sound_count == 1:
		pass
	else:
		Global.sound_count -= 1
		_check_sound()
		Music.effects -= 5
		$Volume2.value -= 20

func _on_sound_plus_button_pressed():
	$SettingsPlayer.play("sound_plus")
	if Global.sound_count == 12:
		pass
	else:
		Global.sound_count += 1
		_check_sound()
		Music.effects += 5
		$Volume2.value += 20

func _on_sens_minus_button_pressed():
	$SettingsPlayer.play("sens_minus")
	if Global.mouse_sense == 1:
		pass
	else:
		Global.mouse_sense -= 1
		_check_sens()
		Global.mouse_sensitivity -= 0.001
		$MouseSens.value -= 0.01

func _on_sens_plus_button_pressed():
	$SettingsPlayer.play("sens_plus")
	if Global.mouse_sense == 12:
		pass
	else:
		Global.mouse_sense += 1
		_check_sens()
		Global.mouse_sensitivity += 0.001
		$MouseSens.value += 0.01
		
func _on_quit_game_pressed():
	$SettingsPlayer.play("exit_game")
	$QuitTimer.start()


func _on_volume_scrolling():
	Music.volume = $Volume.value
	print(Music.volume)


func _on_mouse_sens_scrolling():
	Global.mouse_sensitivity = $MouseSens.value


func _on_volume_2_scrolling():
	Music.effects = $Volume2.value

func _on_check_button_toggled(toggled_on):

	if toggled_on == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)


func _on_exit_timer_timeout():
	$".".hide()


func _on_quit_timer_timeout():
	get_tree().quit()
