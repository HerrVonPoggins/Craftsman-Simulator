extends Node3D
var water = false
var concrete = false
@onready var concrete_bucket_obj = $"../ConcreteBucketObj"



func _on_area_3d_body_entered(body):
	if body.is_in_group("water"):
		body.queue_free()
		water = true
	if body.is_in_group("concrete"):
		body.queue_free()
		concrete = true


func _on_node_3d_3_start_mixer():
	if water == true and concrete == true:
		#animation starten, sobald verfügbar
		concrete_bucket_obj.visible = true
		water = false
		concrete = false
		Global.concrete_mixed = true
