extends Control

signal trowel_button_clicked

var player_raycast = "res://mechanics/Player/RayCast3D.gd"
var trowel_icon = "res://assets/textures/icon.svg"

@onready var trowel_button = $HBoxContainer/TrowelButton

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		self.visible = !self.visible
	if Global.trowel_picked == true:
		trowel_button.Icon = trowel_icon


func _on_trowel_button_pressed():
	emit_signal("trowel_button_clicked")
