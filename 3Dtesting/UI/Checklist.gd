extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#$Panel/VBoxContainer/Label/CheckButton.button_pressed = true
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if $Panel.visible == false:
		$Panel.visible = true

	else:
		$Panel.visible = false
		
