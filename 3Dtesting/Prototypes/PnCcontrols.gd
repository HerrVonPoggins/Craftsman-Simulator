extends CharacterBody3D


const SPEED = 4
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
	
	#wenn der character an dem zielpunkt ankommt dann hält er an
	if position.distance_to(destination) < 0.5:
		velocity = Vector3.ZERO

	#wenn der mausknopf in Firstperson geklickt wird verschwidet der Mauszeiger und bei escape erscheint er wieder
func _unhandled_input(event):
	if $"Neck FP/Camera3D FP".current == true:
	#bei mausbewegung und rechtsklickgedrückthalten dreht sich die kamera und wird oben und unten beschränkt
		if Input.is_action_pressed("rightclick"):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			if event is InputEventMouseMotion:
				neck.rotate_y(-event.relative.x * 0.01)
				cameraFP.rotate_x(-event.relative.y * 0.01)
				cameraFP.rotation.x = clamp(cameraFP.rotation.x, deg_to_rad(-60), deg_to_rad(60))
				$".".rotate_y(-event.relative.x * 0.01)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


		
func faceTo(direction):
	if $"Neck FP/Camera3D FP".current == false:
		look_at(Vector3(direction.x,global_position.y, direction.z),Vector3.UP)

	

func _physics_process(delta):
	#gravity
	if not is_on_floor():
		velocity.y -= gravity * delta


#bei mausklick wird die positiond er maus ermittelt ein laser wird geschossen und wenn dieser mit einem objekt zusammentrifft gibt es einen 3d punkt
#auf den der character sich zu bewegen kann -> 2d maus position auf 3d nutzen
	if Input.is_action_pressed("leftclick") and is_on_floor() == true:
		
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
			if result.size()<1:
				return

			if $"Neck FP/Camera3D FP".current == false:
				$"Neck FP".look_at(result.position)
#bewegt den character zum angeklickten punkt
			
			destination = result.position
			velocity = global_position.direction_to(destination) * SPEED
			faceTo(destination)
			if position != destination: position = position.move_toward(destination, delta * SPEED)
			#$AnimationTree.set("parameters/conditions/idle", velocity == Vector3.ZERO)
			#$AnimationTree.set("parameters/conditions/walk", velocity != Vector3.ZERO)
	move_and_slide()




