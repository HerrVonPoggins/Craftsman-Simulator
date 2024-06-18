extends Node3D

signal start_mixer
signal concrete_bucket_pos_reached
signal inv_trowel_button_clicked
signal delete_sand_container

@onready var trowel = preload("res://mechanics/Tools/trowel.tscn")
@onready var hold = $"CharacterBody3D/Neck/Camera3D/Root Scene3/RootNode/metarig/Skeleton3D/BoneAttachment3D/Hold"





@onready var concrete_bucket_spawn = %ConcreteBucketSpawn
@export var pointer = Vector3.ZERO
#makes the bucket static when it is put in the right spot

func _process(delta):
	if Global.holding_bucket == true:
		Global.holding_bucket = false
		$"CharacterBody3D/Neck/Camera3D/Root Scene3/AnimationPlayer".play("metarig|get bucket out")
		
	if Global.holding_bag == true:
		Global.holding_bag = false
		$"CharacterBody3D/Neck/Camera3D/Root Scene3/AnimationPlayer".play("metarig|get sand sack out")
	
	if Global.is_holding == false:
		$"CharacterBody3D/Neck/Camera3D/Root Scene3/AnimationPlayer".play("Idle_Walking")
		

	$CharacterBody3D/Neck/Camera3D/Arrowhead.look_at(pointer)

	#if Input.is_action_just_pressed("kamera"):
		#$"CharacterBody3D/Neck/Root Scene/AnimationPlayer".play("GrabAction_001")

	if Global.crosshair_off == true:
		$CharacterBody3D/Neck/Camera3D/TextureRect.visible = false
	if Global.crosshair_off == false:
		$CharacterBody3D/Neck/Camera3D/TextureRect.visible = true
		
		
	
func _on_inventory_trowel_button_clicked():
	emit_signal("inv_trowel_button_clicked")


func _on_mixer_sand_level_reached():
	emit_signal("delete_sand_container")


