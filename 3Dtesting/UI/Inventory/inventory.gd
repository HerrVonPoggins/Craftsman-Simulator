extends Control

signal trowel_button_clicked

var player_raycast = "res://mechanics/Player/RayCast3D.gd"
var trowel_icon = "res://assets/textures/icon.svg"

@onready var trowel_button = $HBoxContainer/TrowelButton

func _ready():
	self.visible = false

func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		self.visible = !self.visible
		if self.visible == true:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if self.visible == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if Global.trowel_picked == true:
		$HBoxContainer/TrowelButton.disabled = false


func _on_trowel_button_pressed():
	emit_signal("trowel_button_clicked")
