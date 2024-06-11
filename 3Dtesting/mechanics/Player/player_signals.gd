extends Node3D

signal start_mixer
signal concrete_bucket_pos_reached
signal inv_trowel_button_clicked
signal delete_sand_container

@onready var trowel = preload("res://mechanics/Tools/trowel.tscn")
@onready var hold = $CharacterBody3D/Neck/Camera3D/MeshInstance3D/Hold


@onready var concrete_bucket_spawn = %ConcreteBucketSpawn
@export var pointer = Vector3.ZERO
#makes the bucket static when it is put in the right spot
#func _on_concrete_bucket_pos_body_entered(body):
	#if body.is_in_group("concretebucket"):
		#body.remove_from_group("grab")
		#body.rotation_degrees.x = -45  
		#body.freeze = true
		#body.position = concrete_bucket_spawn.global_position

		#emit_signal("concrete_bucket_pos_reached")
func _process(delta):
	$CharacterBody3D/Neck/Camera3D/Arrowhead.look_at(pointer)
	if Input.is_action_just_pressed("interagieren"):
		$"CharacterBody3D/Neck/Camera3D/Root Scene/AnimationPlayer".play("GrabAction_001")

func _on_inventory_trowel_button_clicked():
	emit_signal("inv_trowel_button_clicked")


func _on_mixer_sand_level_reached():
	emit_signal("delete_sand_container")
