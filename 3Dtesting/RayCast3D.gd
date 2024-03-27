extends RayCast3D


var last = Vector3.ZERO
var obj = null

@onready var point = $"../Hold"


func _process(delta):
	if Input.is_action_just_pressed("leftclick"):
		if obj == null:
			var collider = get_collider()
			if collider != null:
				if collider.is_in_group("grab"):
					obj = collider

	if obj != null:
		last = obj.global_position
		obj.position = point.global_position
		if obj.is_class("RigidBody3D"):
			obj.linear_velocity = Vector3.ZERO

	else:
		if obj != null:
			if obj.is_class("RigidBody3D"):
				var velocity = obj.position - last
				obj.linear_velocity = velocity * 100
		obj = null

	if Input.is_action_pressed("rightclick"):
		obj = null
