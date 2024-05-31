extends Camera3D

signal brick_clicked

var mouse_click = false
var mouse = Vector2()
@onready var camera = $"."

const RAY_LENGTH = 100.0

func _physics_process(delta):
	if mouse_click == true:
		var worldspace = get_world_3d().direct_space_state
		var start = camera.project_ray_origin(mouse)
		var end = start + camera.project_ray_normal(mouse) * RAY_LENGTH
		var result = worldspace.intersect_ray(PhysicsRayQueryParameters3D.create(start, end))
		if result.collider == $"../BrickCut":
			pass

func _input(event):
	if event is InputEventMouse:
		mouse = event.position
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			mouse_click = true

