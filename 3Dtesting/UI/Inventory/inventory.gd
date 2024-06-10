extends Control

signal trowel_button_clicked

@onready var trowel_button = $HBoxContainer/TrowelButton

func _ready():
	self.visible = false

func _process(delta):
	if Global.trowel_picked == true:
		trowel_button.disabled = false


func _on_trowel_button_pressed():
	Music._play_button()
	emit_signal("trowel_button_clicked")


func _on_character_body_3d_inventory():
	self.visible = !self.visible
	if self.visible == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if self.visible == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
