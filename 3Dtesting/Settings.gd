extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$".".visible = false


func _on_volume_scrolling():
	Music.volume = $HScrollBar.value


func _on_mouse_sens_scrolling():
	Global.mouse_sensitivity = $TabContainer/TabBar2/MouseSens.value
