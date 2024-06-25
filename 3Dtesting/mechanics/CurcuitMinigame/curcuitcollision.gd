extends RayCast3D
@onready var player = $Player
var obj = null
var done = false
var moveable = null
var played = false
var played2 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collider = get_collider()




#switch minigame end condition
	if $"../../../StaticBody3D2".rotation_degrees.x == 20 and $"../../../StaticBody3D3".rotation_degrees.x == 20 and $"../../../StaticBody3D4".rotation_degrees.x == 20 and $"../../../StaticBody3D5".rotation_degrees.x == 20 and played == false:
		played = true
		Global.switch_minigame_on = false
		$"../..".current = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		Global.crosshair_off = false
		Global.stay = false
		Global.player_visibility = true
#curcuit minigame end condition
	if $"../../../StaticBody3D2".rotation_degrees.z == 90 and $"../../../StaticBody3D3".rotation_degrees.z == -180 and played2 == false:
		played2 = true
		Global.curcuit_minigame_on = false
		$"../..".current = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		Global.crosshair_off = false
		Global.stay = false
		Global.player_visibility = true
		
	if $"../../../StaticBody3D2".rotation_degrees.x == -40 and done == false:
		$"../../../Node3D".rotate_z(deg_to_rad(20))

	elif $"../../../StaticBody3D2".rotation_degrees.x == 20:
		$"../../../Node3D".rotate_z(deg_to_rad(-20))


	if $"../../../StaticBody3D3".rotation_degrees.x == -40:
		$"../../../Node3D".rotate_z(deg_to_rad(20))

	elif $"../../../StaticBody3D3".rotation_degrees.x == 20:
		$"../../../Node3D".rotate_z(deg_to_rad(-20))


	if $"../../../StaticBody3D4".rotation_degrees.x == -40:
		$"../../../Node3D".rotate_z(deg_to_rad(20))

	elif $"../../../StaticBody3D4".rotation_degrees.x == 20:
		$"../../../Node3D".rotate_z(deg_to_rad(-20))


	if $"../../../StaticBody3D5".rotation_degrees.x == -40:
		$"../../../Node3D".rotate_z(deg_to_rad(20))

	elif $"../../../StaticBody3D5".rotation_degrees.x == 20:
		$"../../../Node3D".rotate_z(deg_to_rad(-20))





	
	if Input.is_action_just_pressed("leftclick"):


		if collider != null:
			if collider.is_in_group("circuit"):
				collider.rotate_z(deg_to_rad(90.0))

			if collider.is_in_group("switch"):
				if collider.rotation.x >= 0:
					collider.rotation.x = deg_to_rad(-40)
				else:
					collider.rotation.x = deg_to_rad(20)
			if collider.is_in_group("wire"):
				moveable = collider

func _unhandled_input(event):
	if moveable != null:
		if event is InputEventMouseButton:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			pass

		elif event.is_action_pressed("ui_cancel"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			pass
		if event is InputEventMouseMotion and $Camera3D.current == true:
			moveable.position.y += (-event.relative.y * 0.01)
			moveable.position.x += (+event.relative.x * 0.01)
	else:
		pass
