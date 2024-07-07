extends Node3D
#
#@onready var wire_1 = $"../Wire"
@onready var player = $"../Player"
@onready var camera = $Camera3D
var wire_1 = false
var wire_2 = false
var wire_3 = false
var wire_4 = false
var wire_5 = false
var wire_6 = false
var played = false
var played2 = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	
	if Global.power_box == true and played == false:
		played = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$Camera3D.current = true
		Global.stay = true
		Global.crosshair_off = true
		Global.player_visibility = false
	
#PowerBox end condition
	if $Wire.global_position == $Outlet2/OutletRange2.global_position and $Wire2.global_position == $Outlet3/OutletRange3.global_position and $Wire3.global_position == $Outlet4/OutletRange4.global_position:
		if  $Wire4.global_position == $Outlet5/OutletRange5.global_position and $Wire5.global_position == $Outlet6/OutletRange6.global_position and $Wire6.global_position == $Outlet7/OutletRange7.global_position:
			if played2 == false:
				played2 = true
				$Camera3D.current = false
				Global.crosshair_off = false
				Global.stay = false
				Global.player_visibility = true
				Global.power_box = false
				$StaticBody3D2.remove_from_group("activate")
				

	

	if Input.is_action_just_pressed("leftclick") and $Camera3D.visible == true:
		var mousePos = get_viewport().get_mouse_position()
		var raylength = 100
		var from = camera.project_ray_origin(mousePos)
		var to = from + camera.project_ray_normal(mousePos) * raylength
		var space = get_world_3d().direct_space_state
		var rayQuery = PhysicsRayQueryParameters3D.new()
		rayQuery.from = from
		rayQuery.to = to
		rayQuery.collide_with_areas = true
		var result = space.intersect_ray(rayQuery)
	
		
		if result.size()<1:
			return

		if result.position != null:
			$Camera3D/Node3D.look_at(result.position)



func _on_outlet_range_2_body_entered(body):
	if body.is_in_group("wire"):
		$Camera3D/Node3D/RayCast3D.moveable = null
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Global.let_go = true
		body.freeze = true
		await get_tree().create_timer(0.5).timeout
		body.global_position = $Outlet2/OutletRange2.global_position
		body.rotation_degrees = Vector3(90,0,0)
func _on_outlet_range_2_body_exited(body):
	if body.is_in_group("wire"):
		body.freeze = false


func _on_outlet_range_3_body_entered(body):
	if body.is_in_group("wire"):
		$Camera3D/Node3D/RayCast3D.moveable = null
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Global.let_go = true
		body.freeze = true
		await get_tree().create_timer(0.5).timeout
		body.global_position = $Outlet3/OutletRange3.global_position
		body.rotation_degrees = Vector3(90,0,0)

func _on_outlet_range_3_body_exited(body):
	if body.is_in_group("wire"):
		body.freeze = false

func _on_outlet_range_4_body_entered(body):
	if body.is_in_group("wire"):
		$Camera3D/Node3D/RayCast3D.moveable = null
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Global.let_go = true
		body.freeze = true
		await get_tree().create_timer(0.5).timeout
		body.global_position = $Outlet4/OutletRange4.global_position
		body.rotation_degrees = Vector3(90,0,0)

func _on_outlet_range_4_body_exited(body):
	if body.is_in_group("wire"):
		body.freeze = false

func _on_outlet_range_5_body_entered(body):
	if body.is_in_group("wire"):
		$Camera3D/Node3D/RayCast3D.moveable = null
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Global.let_go = true
		body.freeze = true
		await get_tree().create_timer(0.5).timeout
		body.global_position = $Outlet5/OutletRange5.global_position
		body.rotation_degrees = Vector3(90,0,0)

func _on_outlet_range_5_body_exited(body):
	if body.is_in_group("wire"):
		body.freeze = false

func _on_outlet_range_6_body_entered(body):
	if body.is_in_group("wire"):
		$Camera3D/Node3D/RayCast3D.moveable = null
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Global.let_go = true
		body.freeze = true
		await get_tree().create_timer(0.5).timeout
		body.global_position = $Outlet6/OutletRange6.global_position
		body.rotation_degrees = Vector3(90,0,0)

func _on_outlet_range_6_body_exited(body):
	if body.is_in_group("wire"):
		body.freeze = false


func _on_outlet_range_7_body_entered(body):
	if body.is_in_group("wire"):
		$Camera3D/Node3D/RayCast3D.moveable = null
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Global.let_go = true
		body.freeze = true
		await get_tree().create_timer(0.5).timeout
		body.global_position = $Outlet7/OutletRange7.global_position
		body.rotation_degrees = Vector3(90,0,0)

func _on_outlet_range_7_body_exited(body):
	if body.is_in_group("wire"):
		body.freeze = false


