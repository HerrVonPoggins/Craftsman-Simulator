extends Node3D

signal start_mixer
signal concrete_bucket_pos_reached
signal delete_sand_container

@onready var trowel = preload("res://mechanics/Tools/trowel.tscn")
@onready var hold = $"CharacterBody3D/Neck/Camera3D/Root Scene3/RootNode/metarig/Skeleton3D/BoneAttachment3D/Hold"

var played = false



@onready var concrete_bucket_spawn = %ConcreteBucketSpawn
@export var pointer = Vector3.ZERO
#makes the bucket static when it is put in the right spot

func _process(delta):
	if Global.player_visibility == false:
		$".".visible = false
	elif Global.player_visibility == true:
		$".".visible = true

	if Global.is_holding == true and played == false:
		played = true
		await get_tree().create_timer(1.5).timeout
		if Global.holding_bucket == false and Global.holding_bricks == false and Global.holding_bag == false:
			$"CharacterBody3D/Neck/Camera3D/Root Scene3/AnimationPlayer".play("metarig|get sand sack out")

	if Global.holding_bucket == true:
		Global.holding_bucket = false
		$"CharacterBody3D/Neck/Camera3D/Root Scene3/AnimationPlayer".play("metarig|get bucket out")
		
	if Global.holding_bag == true:
		Global.holding_bag = false
		$"CharacterBody3D/Neck/Camera3D/Root Scene3/AnimationPlayer".play("metarig|get sand sack out")
	
	if Global.holding_bricks == true:
		Global.holding_bricks = false
		$"CharacterBody3D/Neck/Camera3D/Root Scene3/AnimationPlayer".play("metarig|get bucket out")
	
	
	if Global.is_holding == false:
		played = false
		$"CharacterBody3D/Neck/Camera3D/Root Scene3/AnimationPlayer".play("Idle_Walking")
		

	$CharacterBody3D/Neck/Camera3D/Arrowhead.look_at(pointer)

	#if Input.is_action_just_pressed("kamera"):
		#$"CharacterBody3D/Neck/Root Scene/AnimationPlayer".play("GrabAction_001")

	if Global.crosshair_off == true:
		$CharacterBody3D/Neck/Camera3D/TextureRect.visible = false
	if Global.crosshair_off == false:
		$CharacterBody3D/Neck/Camera3D/TextureRect.visible = true
		
		

func _on_mixer_sand_level_reached():
	emit_signal("delete_sand_container")
