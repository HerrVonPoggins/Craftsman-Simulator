extends Node3D

signal start_mixer
signal bucket_pos_reached



func _on_concrete_bucket_pos_body_entered(body):
	emit_signal("bucket_pos_reached")
