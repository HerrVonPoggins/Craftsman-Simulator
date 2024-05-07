extends CharacterBody3D

var speed
const WALK_SPEED = 10
const SPRINT_SPEED = 20
const JUMP_VELOCITY = 4.5
var is_up = false
var is_crouching = false

#head_bop variables
const bob_freq = 2.0
const bob_amp = 0.03
var t_bob = 0.0


	#Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")



@onready var neck = $Neck
@onready var camera = $Neck/Camera3D
@onready var raycast = $Neck/Camera3D/RayCast3D
@onready var hold = $Neck/Camera3D/Hold
@onready var player_body = $MeshInstance3D
var hold_object: Object

	#capture mouse on leftclick and move camera when mouse is moved
func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event is InputEventMouseMotion:
		neck.rotate_y(-event.relative.x * 0.01)
		camera.rotate_x(-event.relative.y * 0.01)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))
		player_body.rotate_y(-event.relative.x * 0.01)
func _physics_process(delta):
	#gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	#sprint
	if Input.is_action_pressed("sprint"):
		speed = SPRINT_SPEED
	else:
		speed = WALK_SPEED

	if Input.is_action_pressed("leftclick") and is_up == false and Global.dialogue_open == false:
		$"../Animation".play("arm")
		is_up = true
	if not Input.is_action_pressed("leftclick") and is_up == true:
		$"../Animation".play_backwards("arm")
		is_up = false


	if Input.is_action_pressed("crouch") and is_crouching == false:
		$"../Animation".play("crouch")
		is_crouching = true
	if not Input.is_action_pressed("crouch") and is_crouching == true:
		$"../Animation".play_backwards("crouch")
		is_crouching = false

	# jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#WASD Controls
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 7.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 7.0)
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 2.0)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 2.0)

	#head bob
	if is_crouching == false:
		t_bob += delta * velocity.length() * float(is_on_floor())
		camera.transform.origin = _headbob(t_bob)

	move_and_slide()


func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y =sin(time * bob_freq) * bob_amp
	pos.x = cos(time * bob_freq / 2) * bob_amp
	return pos
