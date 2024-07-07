extends RayCast3D
@onready var player = $Player
@onready var switch_1 = $"../../../StaticBody3D2/base cube"
@onready var switch_2 =$"../../../StaticBody3D3/base cube"
@onready var switch_3 = $"../../../StaticBody3D4/base cube"
@onready var switch_4 = $"../../../StaticBody3D5/base cube"
@onready var switch_5 = $"../../../StaticBody3D6/base cube"
@onready var switch_6 = $"../../../StaticBody3D7/base cube"

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
	if switch_1 != null and played == false:
		if switch_1.visible == false and switch_2.visible == false:
			if switch_3.visible == false and switch_4.visible == true:
				if switch_5.visible == false and switch_6.visible == true:
					played = true
					Global.switch_minigame_on = false
					$"../..".current = false
					Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
					Global.crosshair_off = false
					Global.stay = false
					Global.player_visibility = true
					Global.generator_on += 1
					$"../../../StaticBody3D".remove_from_group("activate")
		
		
		
		
#curcuit minigame end condition
	if $"../../../StaticBody3D2".rotation_degrees.z == 180 and $"../../../StaticBody3D3".rotation_degrees.z == 270 and played2 == false:
		if $"../../../StaticBody3D4".rotation_degrees.z == 180 and $"../../../StaticBody3D5".rotation_degrees.z == 180:
			if $"../../../StaticBody3D6".rotation_degrees.z == 90 and $"../../../StaticBody3D7".rotation_degrees.z == 0:
				if $"../../../StaticBody3D8".rotation_degrees.z == 270 and $"../../../StaticBody3D9".rotation_degrees.z == 90:
					if $"../../../StaticBody3D10".rotation_degrees.z == 270:
						print("done")
						played2 = true
						Global.curcuit_minigame_on = false
						$"../..".current = false
						Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
						Global.crosshair_off = false
						Global.stay = false
						Global.player_visibility = true
						Global.generator_on += 1
						$"../../../StaticBody3D".remove_from_group("activate")
						$"../../../StaticBody3D2".remove_from_group("activate")
						$"../../../StaticBody3D3".remove_from_group("activate")
						$"../../../StaticBody3D4".remove_from_group("activate")
						$"../../../StaticBody3D5".remove_from_group("activate")
						$"../../../StaticBody3D6".remove_from_group("activate")
						$"../../../StaticBody3D7".remove_from_group("activate")
						$"../../../StaticBody3D8".remove_from_group("activate")
						$"../../../StaticBody3D9".remove_from_group("activate")
						$"../../../StaticBody3D10".remove_from_group("activate")




	if Input.is_action_just_pressed("leftclick"):


		if collider != null:
			if collider.is_in_group("circuit") and $"../..".current == true:
				collider.rotation.z += deg_to_rad(90) 
				if collider.rotation.z >= deg_to_rad(360):
					collider.rotation.z = deg_to_rad(0)

			if collider.is_in_group("switch"):
				#if collider.rotation.x >= 0:
					#collider.rotation.x = deg_to_rad(-40)
				#else:
					#collider.rotation.x = deg_to_rad(20)
				if collider.get_node("base cube").visible == true and $"../..".current == true:
					collider.get_node("base cube").visible = false
					collider.get_node("base cube2").visible = true
				elif collider.get_node("base cube").visible == false  and $"../..".current == true:
					collider.get_node("base cube").visible = true
					collider.get_node("base cube2").visible = false
					
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
