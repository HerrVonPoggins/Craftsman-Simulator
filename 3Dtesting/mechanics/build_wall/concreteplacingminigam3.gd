extends Node3D
@onready var trowel = $"../Props/Trowel"
@onready var player = $"../Player"

@onready var concrete_1 = $concrete/MeshInstance3D2
@onready var concrete_2 = $concrete2/MeshInstance3D2
@onready var concrete_3 = $concrete3/MeshInstance3D2
@onready var concrete_4 = $concrete4/MeshInstance3D2
@onready var concrete_5 = $concrete5/MeshInstance3D2
@onready var concrete_6 = $concrete6/MeshInstance3D2



#starts the minigame once it becomes visible
func _process(delta):
	if $".".visible == true:
		$Camera3D.current = true
		Global.placing_games_open = true
		player.visible = false
		trowel.visible = false
		Global.stay = true




		#reset for trowel when issues come up
	if Input.is_action_just_pressed("reset"):
		$RigidBody3D.position = Vector3(-0.189,0.112,0)



#moves the trowel with mouse
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



#functions for the concrete points to swipe on brick and resets if failed

func _on_concrete_body_entered(body):
	concrete_1.visible = true
	
func _on_concrete_2_body_entered(body):
	if concrete_1.visible == true:
		concrete_2.visible = true
		$"mörtel".visible = true

func _on_concrete_3_body_entered(body):
	if concrete_2.visible == true:
		concrete_3.visible = true

func _on_concrete_4_body_entered(body):
	if concrete_3.visible == true:
		concrete_4.visible = true
		$"mörtel".scale.x = 10

func _on_concrete_body_exited(body):
	pass


func _on_concrete_2_body_exited(body):
	if concrete_3.visible == false:
		concrete_1.visible = false
		concrete_2.visible = false
		concrete_3.visible = false
		concrete_4.visible = false
		concrete_5.visible = false
		concrete_6.visible = false
		$"mörtel".scale.x = 20
		$"mörtel".visible = false

func _on_concrete_3_body_exited(body):
	if concrete_4.visible == false:
		concrete_1.visible = false
		concrete_2.visible = false
		concrete_3.visible = false
		concrete_4.visible = false
		concrete_5.visible = false
		concrete_6.visible = false
		$"mörtel".scale.x = 20
		$"mörtel".visible = false

#when last concrete is done the minigame ends and scene deletes itself
func _on_concrete_4_body_exited(body):
	if concrete_5.visible == false:
		concrete_1.visible = false
		concrete_2.visible = false
		concrete_3.visible = false
		concrete_4.visible = false
		concrete_5.visible = false
		concrete_6.visible = false
		$"mörtel".scale.x = 20
		$"mörtel".visible = false


func _on_concrete_5_body_entered(body):
	if concrete_4.visible == true:
		concrete_5.visible = true


func _on_concrete_5_body_exited(body):
	if concrete_6.visible == false:
		concrete_1.visible = false
		concrete_2.visible = false
		concrete_3.visible = false
		concrete_4.visible = false
		concrete_5.visible = false
		concrete_6.visible = false
		$"mörtel".scale.x = 20
		$"mörtel".visible = false


func _on_concrete_6_body_entered(body):
	if concrete_5.visible == true:
		concrete_6.visible = true
		$"mörtel".scale.x = 1


func _on_concrete_6_body_exited(body):
	if concrete_6.visible == true:
		Global.concrete_3 = true
		Global.stay = false
		player.visible = true
		trowel.visible = true
		Global.placing_games_open = false
		$".".queue_free()
