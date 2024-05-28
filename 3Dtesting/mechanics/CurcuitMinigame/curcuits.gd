extends Node3D

@onready var camera = $Camera3D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("leftclick"):
		

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

		if result.position != null:
			$Camera3D/Node3D.look_at(result.position)







