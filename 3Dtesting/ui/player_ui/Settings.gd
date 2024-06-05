extends Control

# Called when the node enters the scene tree for the first time.
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
	$".".visible = false


func _on_music_minus_button_pressed():
	if Global.musik_count == 1:
		pass
	else:
		Global.musik_count -= 1
		_check_music()
		$Volume.value -= 20

func _on_music_plus_button_pressed():
	if Global.musik_count == 12:
		pass
	else:
		Global.musik_count += 1
		_check_music()
		$Volume.value += 20

func _on_sound_minus_button_pressed():
	if Global.sound_count == 1:
		pass
	else:
		Global.sound_count -= 1
		_check_sound()
		$Volume2.value -= 20

func _on_sound_plus_button_pressed():
	if Global.sound_count == 12:
		pass
	else:
		Global.sound_count += 1
		_check_sound()
		$Volume2.value += 20

func _on_sens_minus_button_pressed():
	if Global.mouse_sense == 1:
		pass
	else:
		Global.mouse_sense -= 1
		_check_sens()
		$MouseSens.value -= 0.01

func _on_sens_plus_button_pressed():
	if Global.mouse_sense == 12:
		pass
	else:
		Global.mouse_sense += 1
		_check_sens()
		$MouseSens.value += 0.01

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

