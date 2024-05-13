extends StaticBody2D

var selected: bool = false
var mouse_offset
var selected_areas = []
#as long as the player holds down the mouse-button follow_mouse() is called and the item can be dragged.
func _process(_delta):
	if selected == true:
		follow_mouse()

#the items position gets set to the mouse position, so the player can drag it anywhere in the scene
func follow_mouse():
	#mouse_offset makes it so the sprite gets dragged from the position you clicked
	#without it, the sprite gets teleported to the mouse once you click anywhere in the area
	$".".position = get_global_mouse_position() + mouse_offset

func _on_button_up():
	selected = false


func _on_button_down():
	#if the input is the left mouse_button and the player keeps holding it, the variable selected gets set to true 
	# -> follow_mouse can be called
	mouse_offset = position - get_global_mouse_position()
	selected = true
