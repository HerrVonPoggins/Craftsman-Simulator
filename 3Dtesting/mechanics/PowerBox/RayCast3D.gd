extends RayCast3D
var obj = null
var done = false
var moveable = null
var played = false
@onready var player = $Player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.power_box == true and played == false:
		played = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$"../..".current = true
		Global.stay = true
		Global.crosshair_off = true
		Global.player_visibility = false
	
	
	
	
	if Input.is_action_just_pressed("kamera"):
		pass
	if Input.is_action_just_pressed("rightclick"):
		moveable = null
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_just_pressed("leftclick"):
		var collider = get_collider()

		if collider != null:
			if collider.is_in_group("wire"):
				moveable = collider
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if moveable != null:
		if event is InputEventMouseButton:
			
			pass

		elif event.is_action_pressed("ui_cancel"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			pass
		if event is InputEventMouseMotion:
			moveable.position.y += (-event.relative.y * 0.005)
			moveable.position.z += (-event.relative.x * 0.005)
	else:
		pass
