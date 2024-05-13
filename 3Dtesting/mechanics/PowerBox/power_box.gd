extends Node3D

@onready var wire_1 = $"../Wire"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_outlet_range_2_body_entered(body):
	if body.is_in_group("wire"):
		Global.let_go = true
		body.freeze = true
		await get_tree().create_timer(0.5).timeout
		body.position = $Outlet2/OutletRange2.global_position
		body.rotation_degrees = Vector3(90,0,0)
func _on_outlet_range_2_body_exited(body):
	if body.is_in_group("wire"):
		body.freeze = false


func _on_outlet_range_3_body_entered(body):
	if body.is_in_group("wire"):
		Global.let_go = true
		body.freeze = true
		await get_tree().create_timer(0.5).timeout
		body.position = $Outlet3/OutletRange3.global_position
		body.rotation_degrees = Vector3(90,0,0)

func _on_outlet_range_3_body_exited(body):
	if body.is_in_group("wire"):
		body.freeze = false

func _on_outlet_range_4_body_entered(body):
	if body.is_in_group("wire"):
		Global.let_go = true
		body.freeze = true
		await get_tree().create_timer(0.5).timeout
		body.position = $Outlet4/OutletRange4.global_position
		body.rotation_degrees = Vector3(90,0,0)

func _on_outlet_range_4_body_exited(body):
	if body.is_in_group("wire"):
		body.freeze = false

func _on_outlet_range_5_body_entered(body):
	if body.is_in_group("wire"):
		Global.let_go = true
		body.freeze = true
		await get_tree().create_timer(0.5).timeout
		body.position = $Outlet5/OutletRange5.global_position
		body.rotation_degrees = Vector3(90,0,0)

func _on_outlet_range_5_body_exited(body):
	if body.is_in_group("wire"):
		body.freeze = false

func _on_outlet_range_6_body_entered(body):
	if body.is_in_group("wire"):
		Global.let_go = true
		body.freeze = true
		await get_tree().create_timer(0.5).timeout
		body.position = $Outlet6/OutletRange6.global_position
		body.rotation_degrees = Vector3(90,0,0)

func _on_outlet_range_6_body_exited(body):
	if body.is_in_group("wire"):
		body.freeze = false


func _on_outlet_range_7_body_entered(body):
	if body.is_in_group("wire"):
		Global.let_go = true
		body.freeze = true
		await get_tree().create_timer(0.5).timeout
		body.position = $Outlet7/OutletRange7.global_position
		body.rotation_degrees = Vector3(90,0,0)

func _on_outlet_range_7_body_exited(body):
	if body.is_in_group("wire"):
		body.freeze = false


