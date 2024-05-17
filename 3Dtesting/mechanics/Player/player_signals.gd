extends Node3D

signal start_mixer
signal concrete_bucket_pos_reached

@onready var trowel = preload("res://mechanics/Tools/trowel.tscn")
@onready var hold = $"../MeshInstance3D/Hold"

@onready var concrete_bucket_spawn = %ConcreteBucketSpawn
@export var pointer = Vector3.ZERO
#makes the bucket static when it is put in the right spot
func _on_concrete_bucket_pos_body_entered(body):
	if body.is_in_group("concretebucket"):
		body.remove_from_group("grab")
		body.freeze = true
		body.position = concrete_bucket_spawn.global_position
		emit_signal("concrete_bucket_pos_reached")
func _process(delta):
	$CharacterBody3D/Neck/Camera3D/Arrowhead.look_at(pointer)


func _on_inventory_trowel_button_clicked():
	var new_trowel = trowel.instantiate()
	new_trowel.position = hold.position
	add_child(new_trowel)
