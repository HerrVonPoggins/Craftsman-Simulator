extends Node3D

@onready var Brick_1 = $Cube_001
@onready var Brick_2 = $Cube_002
@onready var Brick_3 = $Cube_003
var brick_1_done = false
var brick_2_done = false
var brick_3_done = false

func _ready():
	pass


func _process(delta):
	if Brick_1.rotation.x <= -1.4 and Brick_1.rotation.x >= -1.48:
		Brick_1.rotation.x = -1.57 
		brick_1_done = true
	if Brick_2.rotation.x <= -1.4 and Brick_2.rotation.x >= -1.48:
		Brick_2.rotation.x = -1.57
		brick_2_done = true 
	if Brick_3.rotation.x <= -1.4 and Brick_3.rotation.x >= -1.48:
		Brick_3.rotation.x = -1.57 
		brick_3_done = true
	if brick_1_done == true and brick_2_done == true and brick_3_done == true:
		queue_free()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		pass

		
		
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pass
	if event is InputEventMouseMotion:
		$Hammer.position.y += (-event.relative.y * 0.01)
		$Hammer.position.x += (+event.relative.x * 0.01)
		






func _on_brick_1_body_entered(body):
	if body.is_in_group("hammer"):
		$Cube_001.rotate_z(+0.1)


func _on_brick_2_body_entered(body):
	if body.is_in_group("hammer"):
		$Cube_001.rotate_z(-0.1)


func _on_brick_3_body_entered(body):
	if body.is_in_group("hammer"):
		$Cube_002.rotate_z(+0.1)


func _on_brick_4_body_entered(body):
	if body.is_in_group("hammer"):
		$Cube_002.rotate_z(-0.1)


func _on_brick_5_body_entered(body):
	if body.is_in_group("hammer"):
		$Cube_003.rotate_z(+0.1)


func _on_brick_6_body_entered(body):
	if body.is_in_group("hammer"):
		$Cube_003.rotate_z(-0.1)
