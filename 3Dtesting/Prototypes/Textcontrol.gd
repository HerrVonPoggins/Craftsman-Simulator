extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var neck = $Neck
@onready var camera = $Neck/Camera3D
@onready var raycast = $Neck/Camera3D/RayCast3D
@onready var hold = $Neck/Camera3D/Hold
var hold_object: Object


#func _unhandled_input(event):
#
	#if event is InputEventMouseMotion:
		#neck.rotate_y(-event.relative.x * 0.01)
		#camera.rotate_x(-event.relative.y * 0.01)
		#camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))


func _physics_process(delta):

	if not is_on_floor():
		velocity.y -= gravity * delta



	move_and_slide()









func _on_line_edit_text_submitted(new_text):
	if new_text == "right":
		var direction = (transform.basis * Vector3(100, 0, 100)).normalized()
		velocity.x = direction.x * SPEED 
	if new_text == "left":
		var direction = (transform.basis * Vector3(-100, 0, -100)).normalized()
		velocity.x = direction.x * SPEED 
	if new_text == "back":
		var direction = (transform.basis * Vector3(100, 0, 100)).normalized()
		velocity.z = direction.z * SPEED 
	if new_text == "front":
		var direction = (transform.basis * Vector3(-100, 0, -100)).normalized()
		velocity.z = direction.z * SPEED 
	if new_text == "jump" and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if new_text == "stop":
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
