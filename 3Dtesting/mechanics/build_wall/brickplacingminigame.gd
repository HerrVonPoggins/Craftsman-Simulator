extends Node3D



func _ready():
	pass


func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event is InputEventMouseMotion:
		$Sledgehammer.position.y = (-event.relative.y * Global.mouse_sensitivity)
		$Sledgehammer.position.x = (event.relative.x * Global.mouse_sensitivity)
		
		


