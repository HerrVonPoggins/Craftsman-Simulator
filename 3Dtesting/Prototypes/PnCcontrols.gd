extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
#@onready var navigation : NavigationAgent3D = $NavigationAgent3D
@onready var neck = $"Neck FP"
@onready var camera = $"../Neck ISO/Camera3D ISO"
@onready var cameraFP = $"Neck FP/Camera3D FP"
@onready var raycast = $"../Neck ISO/Camera3D ISO/RayCast3D"
@onready var hold = $"../Neck ISO/Camera3D ISO/Hold"
var destination = Vector3.ZERO
var hold_object: Object

func _process(delta):
	if position.distance_to(destination) < 0.5:
		velocity = Vector3.ZERO
	#if (navigation.is_navigation_finished()):
		#return

func _unhandled_input(event):
	if $"Neck FP/Camera3D FP".current == true:
		if event is InputEventMouseButton:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		elif event.is_action_pressed("ui_cancel"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.01)
			cameraFP.rotate_x(-event.relative.y * 0.01)
			cameraFP.rotation.x = clamp(cameraFP.rotation.x, deg_to_rad(-60), deg_to_rad(60))


func _physics_process(delta):

	if not is_on_floor():
		velocity.y -= gravity * delta




	if Input.is_action_pressed("leftclick"):
		
		if $"../Neck ISO/Camera3D ISO".current == true:
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
			
			#navigation.target_position = result.position
			if result.size()<1:
				return
			#moveToPoint(delta, SPEED)


			destination = result.position
			velocity = global_position.direction_to(destination) * SPEED
			
			if position != destination: position = position.move_toward(destination, delta * SPEED)
			#if position.distance_to(destination) < 0.5:
				#velocity = Vector3.ZERO
	move_and_slide()


#func moveToPoint(delta, speed):
	#var target = navigation.get_next_path_position()
	#var direction = global_position.direction_to(target)
	#velocity = direction * speed

