extends Control

@onready var trowel_button = $HBoxContainer/TrowelButton
@onready var spirit_level_button = $HBoxContainer/SpiritLevelButton

func _process(delta):
	if Global.trowel_picked == true:
		trowel_button.disabled = false
	if Global.spirit_level_picked == true:
		spirit_level_button.disabled = false
