extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var neck = $Neck
@onready var camera = $"../Neck/Camera3D"
@onready var raycast = $Neck/Camera3D/RayCast3D
@onready var hold = $Neck/Camera3D/Hold
var hold_object: Object


func _unhandled_input(event):

	#if event is InputEventMouseMotion:
		#neck.rotate_y(-event.relative.x * 0.01)
		#camera.rotate_x(-event.relative.y * 0.01)
		#camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))
	pass

func _physics_process(delta):

	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("rightclick"):
		var mousePos = get_viewport().get_mouse_position()


	if Input.is_action_pressed("leftclick"):
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


		var destination = result.position
		velocity = global_position.direction_to(destination) * SPEED

		if position != destination: position = position.move_toward(destination, delta * SPEED)
		if position.distance_to(destination) < 10:
			velocity = Vector3.ZERO

	move_and_slide()






func _on_line_edit_text_submitted(new_text):
	pass # Replace with function body.
