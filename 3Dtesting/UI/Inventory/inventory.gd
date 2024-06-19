extends Control

@onready var trowel_button = $HBoxContainer/TrowelButton
@onready var spirit_level_button = $HBoxContainer/SpiritLevelButton

func _process(delta):
	if Global.trowel_picked == true:
		trowel_button.disabled = false
	if Global.spirit_level_picked == true:
		spirit_level_button.disabled = false


func _on_trowel_button_pressed():
	Music._play_button()


func _on_spirit_level_button_pressed():
	Music._play_button()
