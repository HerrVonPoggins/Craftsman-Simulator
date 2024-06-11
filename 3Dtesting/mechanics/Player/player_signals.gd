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

func _process(delta):
	$CharacterBody3D/Neck/Camera3D/Arrowhead.look_at(pointer)


	if Global.crosshair_off == true:
		$CharacterBody3D/Neck/Camera3D/TextureRect.visible = false
	if Global.crosshair_off == false:
		$CharacterBody3D/Neck/Camera3D/TextureRect.visible = true
		
		
	
func _on_inventory_trowel_button_clicked():
	emit_signal("inv_trowel_button_clicked")


func _on_mixer_sand_level_reached():
	emit_signal("delete_sand_container")


