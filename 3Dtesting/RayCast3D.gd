extends RayCast3D


var last = Vector3.ZERO
var obj = null

@onready var point = $"../Hold"

#methoden um sachen aufzuheben -> raycast laser mit begrenzter reichweite trifft auf ein objekt und wenn es in der grupp grab ist kann es aufgehoebn werden
#das objekt wird am hold punkt gehalten
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

#bei rechtsklick wird das objekt wieder losgelassen
	if Input.is_action_pressed("rightclick"):
		obj = null
