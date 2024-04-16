extends Node3D

signal start_mixer
signal concrete_bucket_pos_reached
@onready var concrete_bucket_spawn = %ConcreteBucketSpawn

func _on_concrete_bucket_pos_body_entered(body):
	if body.is_in_group("concretebucket"):
		body.remove_from_group("grab")
		body.freeze = true
		body.position = concrete_bucket_spawn.global_position
		emit_signal("concrete_bucket_pos_reached")
