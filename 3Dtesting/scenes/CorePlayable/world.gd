extends Node3D

var mat1 = load("res://assets/textures/material_white.tres")
var counter = 0
var played = false
var played2 = false
var played3 = false
var played4 = false
var played5 = false
var diealogue_played = 0
var done = false

#plays the animation to fade into the scene from the black screen
func _ready():
	Music._play_bricklayer()
	Global.ground_floor = $house_base/StaticBody3D.get_instance_id()
	Global.ground_grass = $"Map/map/Boden modified/StaticBody3D".get_instance_id()
	Global.current_scene = 1
	DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_intro.dialogue"))
	$Enter.play("fade_in")
	$Player.pointer = $Props/Trowel.global_position
	$WallAnimation.play("Brick_test") 
	#when the wall is build the animation to fill in the remaining bricks and a praise dialogue is started
func _process(delta):
	if Input.is_action_just_pressed("kamera"):
		Global.wall_finished = true
		
	if Global.concrete_filled_roof == true:
		$"Root Scene".visible = true
		$"Root Scene/RootNode/Cube/StaticBody3D/CollisionShape3D".call_deferred("set_disabled", false)
	
		
		
	if Global.roof_finished == true and played5 == false:
		played5 = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_8.dialogue"))
		$ConcreteFiller.visible = true
		
	if Global.placing_games_open == true:
		$Wall.visible = false
	else:
		$Wall.visible = true
		
	
		
		
	if Global.rods == 5 and played4 == false:
		Global.can_make_roof = true
		played4 = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_6.dialogue"))
		

	if Global.crane_on == true and played2 == false:
		$"Root Scene2/AnimationPlayer2".play("Kran teil1|Kran teil1_Go")
		$"Root Scene2/AnimationPlayer".play("Kran teil1_001|Kran teil1_Los")
		played2 = true
		await get_tree().create_timer(5).timeout
		$Props/Decke1.visible = true
		$Props/Decke2.visible = true
		$Props/Decke3.visible = true
		$Props/Decke4.visible = true
		$Props/Decke5.visible = true
		$Props/Decke7.visible = true
		$Props/Decke8.visible = true
		$Props/Decke9.visible = true
		Global.start_crane_game = true
		

	if Global.concrete_mixed == true and $Area3D/Bucket_water2.visible == false and done == false:
		$Area3D/Bucket_water2.visible = true
		$Props/ConcreteBucket/CollisionShape3D.call_deferred("set_disabled", false)
		done = true







	if Global.concrete_1 == true:
		$"Area3D2/mörtel".visible = true
	if Global.concrete_2 == true:
		$"Area3D3/mörtel".visible = true
	if Global.concrete_3 == true:
		$"Area3D4/mörtel".visible = true
	
	
	

		
		
	if Global.tutorial_finished == true and counter == 0:
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_1.dialogue"))
		counter = 0.5
		
	if $StringWedge/MeshInstance3D.visible == true and $StringWedge2/MeshInstance3D.visible == true and Global.string == false:
		Music._play_string()
		$StringWedge/String.visible = true
		Global.string = true
		Global.isolation = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_3.dialogue"))
	
	
	if Global.wall_finished == true and played == false:
		played = true
		$"house_base/geruest merged".visible = true
		$"house_base/geruest merged/StaticBody3D/CollisionShape3D".call_deferred("set_disabled", false)
		#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		#hier restliche Wand animationen reinmachen$"house_anim_1(1)".visible = true
		$"house_anim_1(1)".visible = true
		$"house_anim_1(1)/AnimationPlayer".play("Scene")
		await  $"house_anim_1(1)/AnimationPlayer".animation_finished
		$StaticBody3D/CollisionShape3D.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D2.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D3.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D4.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D5.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D6.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D7.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D8.call_deferred("set_disabled", false)
		
		
		
		
		
		
		

		$"house_anim_3(1)".visible = true
		$"house_anim_3(1)/AnimationPlayer".play("Scene")
		
		$house_base/StaticBody3D2/CollisionShape3D.call_deferred("set_disabled", false)
		$house_base/StaticBody3D2/CollisionShape3D2.call_deferred("set_disabled", false)
		$house_base/StaticBody3D2/CollisionShape3D3.call_deferred("set_disabled", false)
		$house_base/StaticBody3D2/CollisionShape3D4.call_deferred("set_disabled", false)
		$house_base/StaticBody3D2/CollisionShape3D5.call_deferred("set_disabled", false)
		$house_base/StaticBody3D2/CollisionShape3D6.call_deferred("set_disabled", false)
		$house_base/StaticBody3D2/CollisionShape3D7.call_deferred("set_disabled", false)
		
		
		
		
		
		
		
		await $"house_anim_3(1)/AnimationPlayer".animation_finished
		$"house_anim_2(1)".visible = true
		$"house_anim_2(1)/AnimationPlayer".play("Scene")

		#$"Root Scene/RootNode/Wand Unten_006/StaticBody3D/CollisionShape3D".call_deferred("set_disabled", false)
		#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		$Doortop5.visible = true
		$Doortop6.visible = true
		$Doortop7.visible = true
		$Doortop8.visible = true
		#$Node3D.visible = true
		#$Node3D3.visible = true
		#$Node3D4.visible = true
		$"house_base/geruest merged".visible = true
		played = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_4.dialogue"))
		
	if Global.door_top == 4 and Global.window_top == 0 and played3 == false:
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_5.dialogue"))
		played3 = true
		$Rod.visible = true
		$Rod2.visible = true
		$Rod3.visible = true
		$Rod4.visible = true
		$Rod5.visible = true
			

#functions for the info hub to pause the scene
func _on_control_opened():
	get_tree().paused = true


func _on_control_closed():
	get_tree().paused = false

#if the trowel is carried through the bucket the concrete is "on it"
func _on_concrete_bucket_body_entered(body):
	if body.is_in_group("trowel"):
		Global.concrete = true
	if body.is_in_group("tool"):
		Global.concrete = true



func _on_string_wedge_body_entered(body):
	if body.is_in_group("wedge") and Global.concrete_mixed == true:
		body.queue_free()
		Music._play_wedge()
		$StringWedge/MeshInstance3D.visible = true
		$StringWedge/MeshInstance3D2.visible = false
		$StringWedge/CollisionShape3D.call_deferred("set_disabled", true)

func _on_string_wedge_2_body_entered(body):
	if body.is_in_group("wedge") and Global.concrete_mixed == true:
		body.queue_free()
		Music._play_wedge()
		$StringWedge2/MeshInstance3D.visible = true
		$StringWedge2/MeshInstance3D2.visible = false
		$StringWedge2/CollisionShape3D.call_deferred("set_disabled", true)


func _on_ray_cast_3d_start_saw_minigame():
	if Global.brick_sawed == false:
		$Saw/SawCamera.current = true
		Global.brick_saw_cam = true
		Global.stay = true
	

func _on_area_3d_2_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true:
		$Area3D2/CollisionShape3D.call_deferred("set_disabled", true)
		$Node3D5.visible = true


func _on_area_3d_3_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true and Global.concrete_1 == true:
		$Area3D3/CollisionShape3D.call_deferred("set_disabled", true)
		$Node3D7.visible = true


func _on_area_3d_4_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true and Global.concrete_2 == true:
		$Area3D4/CollisionShape3D.call_deferred("set_disabled", true)
		$Node3D8.visible = true


func _on_area_3d_5_body_entered(body):
	if body.is_in_group("spirit_level"):
		body.queue_free()
		$Node3D9.visible = true



func _on_saw_camera_brick_cut_correct():
	$Saw/BrickCut.queue_free()
	Global.brick_sawed = true
	Global.brick_saw_cam = false
	$Props/Brick3.visible = true
	Global.stay = false
	$Player/CharacterBody3D/Neck/Camera3D.current = true
	$Props/Brick3/CollisionShape3D.call_deferred("set_disabled", false)
	
	$Props/Brick3.freeze = false




func _on_area_3d_body_entered(body):
	if body.is_in_group("concretebucket"):
		body.queue_free()
		#$Area3D/Bucket_water2.queue_free()
		$Area3D/ConcreteBucketObj.visible = true
		$Area3D/Bucket_water2.visible = false



func _on_inventory_spirit_level_button_clicked():
	pass # Replace with function body.

@onready var water = $Props/Water/Mesh
@onready var sand1 = $Props/Sand/Mesh

const HIGHLIGHT = preload("res://scenes/CorePlayable/highlight.tres")
 
func _on_ray_cast_3d_mixer_highlight():
	water.mesh.surface_get_material(0).next_pass = HIGHLIGHT
	water.mesh.surface_get_material(1).next_pass = HIGHLIGHT
	water.mesh.surface_get_material(2).next_pass = HIGHLIGHT
	water.mesh.surface_get_material(3).next_pass = HIGHLIGHT

	sand1.mesh.surface_get_material(0).next_pass = HIGHLIGHT
	sand1.mesh.surface_get_material(1).next_pass = HIGHLIGHT
	sand1.mesh.surface_get_material(2).next_pass = HIGHLIGHT

@onready var wedge = $Props/Wedge/Mesh

func _on_ray_cast_3d_wedge_highlight():
	wedge.mesh.surface_get_material(0).next_pass = HIGHLIGHT
