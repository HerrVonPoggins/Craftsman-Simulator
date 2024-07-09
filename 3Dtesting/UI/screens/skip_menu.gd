extends Control

var played = false
var played2 = false
var played3 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if $".".visible == true:
		Global.stay = true
		Global.crosshair_off = true
		Global.dialogue_open = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	#elif $Panel.visible == false:
		#Global.stay = false
		#Global.crosshair_off = false
		#Global.dialogue_open = false
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	if Global.skip == 2 and played2 == false:
		played2 = true
		$".".visible = true
	if Global.skip == 3 and played3 == false:
		played3 = true
		$".".visible = true

func _on_button_pressed():
	if played == false:

		$".".visible = false
		Global.stay = false
		Global.crosshair_off = false
		Global.dialogue_open = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		if Global.skip == 2:
			Global.rods = 19
		if Global.skip == 3:
			$"../..".metallbinder_count = 15
			await get_tree().create_timer(5).timeout
			$"../..".metallbinder_count = 26
			await get_tree().create_timer(5).timeout
			$"../..".metallbinder_count = 37
			await get_tree().create_timer(5).timeout
			$"../..".metallbinder_count = 44
func _on_button_2_pressed():
	if played == false:

		Global.stay = false
		Global.crosshair_off = false
		Global.dialogue_open = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		$".".visible = false
