extends Node3D
var water = false
var concrete = false
@onready var concrete_bucket_obj = $"../Props/ConcreteBucketObj"
@onready var collision_shape_3d = $"../Props/ConcreteBucketObj/CollisionShape3D"


	#mechanic to fill water and concretebag into the mixer
func _on_range_body_entered(body):
	if body.is_in_group("water"):
		body.queue_free()
		water = true
	if body.is_in_group("concrete"):
		body.queue_free()
		concrete = true


func _on_player_start_mixer():
	if water == true and concrete == true:
		#if mixer is turned on the concrete bucket becomes visible 
		concrete_bucket_obj.visible = true
		concrete_bucket_obj.freeze = false
		collision_shape_3d.disabled = false
		water = false
		concrete = false
		Global.concrete_mixed = true
