extends Node3D
@onready var trowel = $"../Props/Trowel"
@onready var player = $"../Player"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $".".visible == true:
		$Camera3D.current = true
		Global.placing_games_open = true
		player.visible = false
		trowel.visible = false
		Global.stay = true
	if $concrete7/MeshInstance3D2.visible == true:
		Global.concrete_2 = true

	if Input.is_action_just_pressed("reset"):
		$RigidBody3D.position = Vector3(-0.189,0.112,0)



func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		pass

		
		
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pass
	if event is InputEventMouseMotion and $Camera3D.current == true:
		$RigidBody3D.position.z += (+event.relative.y * 0.01)
		$RigidBody3D.position.x += (+event.relative.x * 0.01)


func _on_concrete_body_entered(body):
	$concrete/MeshInstance3D2.visible = true


func _on_concrete_2_body_entered(body):
	if $concrete/MeshInstance3D2.visible == true:
		$concrete2/MeshInstance3D2.visible = true


func _on_concrete_3_body_entered(body):
	if $concrete2/MeshInstance3D2.visible == true:
		$concrete3/MeshInstance3D2.visible = true


func _on_concrete_4_body_entered(body):
	if $concrete3/MeshInstance3D2.visible == true:
		$concrete4/MeshInstance3D2.visible = true


func _on_concrete_5_body_entered(body):
	if $concrete4/MeshInstance3D2.visible == true:
		$concrete5/MeshInstance3D2.visible = true


func _on_concrete_6_body_entered(body):
	if $concrete5/MeshInstance3D2.visible == true:
		$concrete6/MeshInstance3D2.visible = true


func _on_concrete_7_body_entered(body):
	if $concrete6/MeshInstance3D2.visible == true:
		$concrete7/MeshInstance3D2.visible = true







func _on_concrete_body_exited(body):
	pass
	#if $concrete7/MeshInstance3D2.visible == false:
		#$concrete/MeshInstance3D2.visible = false
		#$concrete2/MeshInstance3D2.visible = false
		#$concrete3/MeshInstance3D2.visible = false
		#$concrete4/MeshInstance3D2.visible = false
		#$concrete5/MeshInstance3D2.visible = false
		#$concrete6/MeshInstance3D2.visible = false
		#$concrete7/MeshInstance3D2.visible = false



func _on_concrete_2_body_exited(body):
	if $concrete3/MeshInstance3D2.visible == false:
		$concrete/MeshInstance3D2.visible = false
		$concrete2/MeshInstance3D2.visible = false
		$concrete3/MeshInstance3D2.visible = false
		$concrete4/MeshInstance3D2.visible = false
		$concrete5/MeshInstance3D2.visible = false
		$concrete6/MeshInstance3D2.visible = false
		$concrete7/MeshInstance3D2.visible = false


func _on_concrete_3_body_exited(body):
	if $concrete4/MeshInstance3D2.visible == false:
		$concrete/MeshInstance3D2.visible = false
		$concrete2/MeshInstance3D2.visible = false
		$concrete3/MeshInstance3D2.visible = false
		$concrete4/MeshInstance3D2.visible = false
		$concrete5/MeshInstance3D2.visible = false
		$concrete6/MeshInstance3D2.visible = false
		$concrete7/MeshInstance3D2.visible = false


func _on_concrete_4_body_exited(body):
	if $concrete5/MeshInstance3D2.visible == false:
		$concrete/MeshInstance3D2.visible = false
		$concrete2/MeshInstance3D2.visible = false
		$concrete3/MeshInstance3D2.visible = false
		$concrete4/MeshInstance3D2.visible = false
		$concrete5/MeshInstance3D2.visible = false
		$concrete6/MeshInstance3D2.visible = false
		$concrete7/MeshInstance3D2.visible = false


func _on_concrete_5_body_exited(body):
	if $concrete6/MeshInstance3D2.visible == false:
		$concrete/MeshInstance3D2.visible = false
		$concrete2/MeshInstance3D2.visible = false
		$concrete3/MeshInstance3D2.visible = false
		$concrete4/MeshInstance3D2.visible = false
		$concrete5/MeshInstance3D2.visible = false
		$concrete6/MeshInstance3D2.visible = false
		$concrete7/MeshInstance3D2.visible = false


func _on_concrete_6_body_exited(body):
	if $concrete7/MeshInstance3D2.visible == false:
		$concrete/MeshInstance3D2.visible = false
		$concrete2/MeshInstance3D2.visible = false
		$concrete3/MeshInstance3D2.visible = false
		$concrete4/MeshInstance3D2.visible = false
		$concrete5/MeshInstance3D2.visible = false
		$concrete6/MeshInstance3D2.visible = false
		$concrete7/MeshInstance3D2.visible = false


func _on_concrete_7_body_exited(body):
	if	$concrete7/MeshInstance3D2.visible == true:
		Global.concrete_2 = true
		Global.stay = false
		player.visible = true
		trowel.visible = true
		Global.placing_games_open = false
		$".".queue_free()
