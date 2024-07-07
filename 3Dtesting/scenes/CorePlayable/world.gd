extends Node3D

var mat1 = load("res://assets/textures/material_white.tres")
var counter = 0
var played = false
var played2 = false
var played3 = false
var played4 = false
var played5 = false
var played6 = false
var played7 = false
var played8 = false
var dialogue_played = 0
var done = false

var shader = preload("res://scenes/CorePlayable/shine_shader.gdshader")
@onready var wedge = $Props/Wedge/Mesh
@onready var water = $Props/Water/Mesh
@onready var sand1 = $Props/Sand/Mesh
const HIGHLIGHT = preload("res://scenes/CorePlayable/highlight.tres")
var mixer_highlighted = false 
var wedges_highlighted = false
#plays the animation to fade into the scene from the black screen
#sets the ground for the walk sound
func _ready():
	Checklist._movement_visual()
	Checklist._sprint_visual()
	Checklist._crouch_visual()
	
	
	
	
	
	Music._play_bricklayer()
	Global.ground_floor = $house_base/StaticBody3D.get_instance_id()
	Global.ground_grass = $"Map/map/Boden modified/StaticBody3D".get_instance_id()
	Global.current_scene = 1
	DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_intro.dialogue"))
	$Enter.play("fade_in")
	$Player.pointer = $Props/Trowel.global_position
	$WallAnimation.play("Brick_test") 
	await get_tree().create_timer(5).timeout
	Checklist._movement_visual_hide()
	Checklist._sprint_visual_hide()
	Checklist._crouch_visual_hide()

	Checklist._interact_visual()
	Checklist._mouse_right_visual()
	await get_tree().create_timer(5).timeout
	Checklist._interact_visual_hide()
	Checklist._mouse_right_visual_hide()




func _process(delta):
	if Input.is_action_just_pressed("kamera"):
		
		#get_tree().reload_current_scene()
		#Global.wall_finished = true
		#Global.roof_finished = true
		pass
		
		#unbug yourself by teleporting back to startpoint
	if Input.is_action_just_pressed("reset"):
		$Player.get_node("CharacterBody3D").global_position = Vector3(-27.678, -15.318, 594.655)
		print("reset")
		
	#when the filling minigame is finished the solid roof becomes visible
	if Global.concrete_filled_roof == true and played6 == false:
		played6 = true
		$"Root Scene".visible = true
		$"Root Scene/RootNode/Cube/StaticBody3D/CollisionShape3D".call_deferred("set_disabled", false)
		await get_tree().create_timer(5).timeout
		$Transition._change_scene("res://UI/screens/scene_change.tscn")


	#when the roof minigame is finished the filling action starts
	if Global.roof_finished == true and played5 == false:
		played5 = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_8.dialogue"))
		$"Root Scene2".visible = true
		$FillerPump.visible = true
		$FillerPump/CollisionShape3D.call_deferred("set_disabled", false)

	if Global.filler_started == true and played8 == false:
		played8 = true
		$ConcreteFiller.visible = true
		$FillerPump.remove_from_group("activate")
		$FillerPump.remove_from_group("filler_pump")

	#make the wall outline invisible while the concrete is put on the bricks
	if Global.placing_games_open == true:
		$Wall.visible = false
	elif Global.string == true:
		$Wall.visible = true

	if Global.rods == 3 and played7 == false:
		played7 = false
		Global.skip = 2


	#when the rods to support the roof are all placed and extended the roof crane can be activated
	if Global.rods == 19 and played4 == false:
		Global.can_make_roof = true
		played4 = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_6.dialogue"))
		




	#crane animation is played when activated and the roof parts appear
	if Global.crane_on == true and played2 == false:
		$"Root Scene2/AnimationPlayer2".play("Kran teil1|Kran teil1_Go")
		$"Root Scene2/AnimationPlayer".play("Kran teil1_001|Kran teil1_Los")
		$"Root Scene2/RootNode/StaticBody3D".remove_from_group("activate")
		$"Root Scene2/RootNode/StaticBody3D".remove_from_group("truck")
		played2 = true
		await get_tree().create_timer(5).timeout
		$"Root Scene2".visible = false
		$Props/Decke1.visible = true
		$Props/Decke2.visible = true
		$Props/Decke3.visible = true
		$Props/Decke4.visible = true
		$Props/Decke5.visible = true
		$Props/Decke7.visible = true
		$Props/Decke8.visible = true
		$Props/Decke9.visible = true
		Global.start_crane_game = true

	#makes the bucket with concrete visible 
	if Global.concrete_mixed == true and $Area3D/Bucket_water2.visible == false and done == false:
		$Area3D/Bucket_water2.visible = true
		$Props/ConcreteBucket/CollisionShape3D.call_deferred("set_disabled", false)
		$Props/Wedge/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Wedge2/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$StringWedge.visible = true
		$StringWedge2.visible = true
		done = true






	#whent the concrete placing minigames are done a concrete texture appears on the bricks
	if Global.concrete_1 == true:
		$"Area3D2/mörtel".visible = true
	if Global.concrete_2 == true:
		$"Area3D3/mörtel".visible = true
	if Global.concrete_3 == true:
		$"Area3D4/mörtel".visible = true





	# once the tutorial is done a dialogue plays and the player can continue 
	if Global.tutorial_finished == true and counter == 0:
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_1.dialogue"))
		$Props/Concrete/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Concrete/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Sand/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Sand/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Sand2/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Sand2/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Sand3/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Sand3/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Sand4/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Sand4/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Water/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		counter = 0.5




	#when the stringwedges are placed the string appears and the player can start the wall building
	if $StringWedge/MeshInstance3D.visible == true and $StringWedge2/MeshInstance3D.visible == true and Global.string == false:
		Music._play_string()
		$StringWedge/String.visible = true
		Global.string = true
		Global.isolation = true
		$Props/Brick1/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Brick2/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Brick3/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_3.dialogue"))
		$Wall.visible = true




	#when the wall is build the animations will start after 3 seconds wait time and the collisionshapes for the walls are turned on
	#the doortops can be placed 
	if Global.wall_finished == true and played == false:
		played = true
		await get_tree().create_timer(3).timeout
		$"house_base/geruest merged".visible = true
		$"house_base/geruest merged/StaticBody3D/CollisionShape3D".call_deferred("set_disabled", false)
		$Ladder/Area3D/CollisionShape3D.call_deferred("set_disabled", false)
		$Ladder/StaticBody3D/CollisionShape3D.call_deferred("set_disabled", false)
		
		
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
		$StaticBody3D/CollisionShape3D9.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D10.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D11.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D12.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D13.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D14.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D15.call_deferred("set_disabled", false)
		$StaticBody3D/CollisionShape3D16.call_deferred("set_disabled", false)
		$Doortop5.visible = true
		$Doortop6.visible = true
		$Doortop7.visible = true
		$Doortop8.visible = true
		$Props/Doorframe/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Doorframe2/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Doorframe3/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Doorframe4/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$"house_base/geruest merged".visible = true
		played = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_4.dialogue"))


	#when the doortops are all placed the rods becom active 
	if Global.door_top == 4 and Global.window_top == 0 and played3 == false:
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_5.dialogue"))
		played3 = true
		$Rod.visible = true
		$Rod2.visible = true
		$Rod3.visible = true
		$Rod4.visible = true
		$Rod5.visible = true
		$Rod6.visible = true
		$Rod7.visible = true
		$Rod8.visible = true
		$Rod9.visible = true
		$Rod10.visible = true
		$Rod11.visible = true
		$Rod12.visible = true
		$Rod13.visible = true
		$Rod14.visible = true
		$Rod15.visible = true
		$Rod16.visible = true
		$Rod17.visible = true
		$Rod18.visible = true
		$Rod19.visible = true
		$Props/Rod/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod2/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod2/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod3/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod3/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod4/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod4/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod5/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod5/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod6/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod6/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod7/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod7/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod8/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod8/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod9/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod9/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod10/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod10/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod11/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod11/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod12/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod12/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod13/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod13/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod14/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod14/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod15/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod15/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod16/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod16/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod17/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod17/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod18/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod18/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod19/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Rod19/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))



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


#string wedges logic to place them once the mixer minigame is done
func _on_string_wedge_body_entered(body):
	if body.is_in_group("wedge") and Global.concrete_mixed == true:
		body.queue_free()
		Global.is_holding = false
		Global.can_extend = false
		Music._play_wedge()
		$StringWedge/MeshInstance3D.visible = true
		$StringWedge/MeshInstance3D2.visible = false
		$StringWedge/CollisionShape3D.call_deferred("set_disabled", true)
func _on_string_wedge_2_body_entered(body):
	if body.is_in_group("wedge") and Global.concrete_mixed == true:
		body.queue_free()
		Global.is_holding = false
		Global.can_extend = false
		Music._play_wedge()
		$StringWedge2/MeshInstance3D.visible = true
		$StringWedge2/MeshInstance3D2.visible = false
		$StringWedge2/CollisionShape3D.call_deferred("set_disabled", true)


#starts the saw
func _on_ray_cast_3d_start_saw_minigame():
	if Global.brick_sawed == false:
		$Saw/SawCamera.current = true
		Global.brick_saw_cam = true
		Global.stay = true


#when the trowel with concrete on it is put in the area the placing minigame starts
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


#starts spirit level and hammer minigame
func _on_area_3d_5_body_entered(body):
	if body.is_in_group("spirit_level"):
		body.queue_free()
		Global.is_holding = false
		Global.can_extend = false
		$Node3D9.visible = true


#reveals the cut brick after finishing the game
func _on_saw_camera_brick_cut_correct():
	$Saw/BrickCut.queue_free()
	Global.brick_sawed = true
	Global.brick_saw_cam = false
	$Props/Brick3.visible = true
	Global.stay = false
	$Saw.remove_from_group("activate")
	$Player/CharacterBody3D/Neck/Camera3D.current = true
	$Props/Brick3/CollisionShape3D.call_deferred("set_disabled", false)
	$Props/Brick3.freeze = false



#makes the concrete bucket on the fixed spot visible
func _on_area_3d_body_entered(body):
	if body.is_in_group("concretebucket"):
		body.queue_free()
		Global.is_holding = false
		Global.can_extend = false
		$Area3D/ConcreteBucketObj.visible = true
		$Area3D/Bucket_water2.visible = false
		$Area3D/ConcreteBucketObj/CollisionShape3D.call_deferred("set_disabled", false)
		$Area3D/ConcreteBucketObj/ConcreteBucket/CollisionShape3D.call_deferred("set_disabled", false)


#highlight the mixer
func _on_ray_cast_3d_mixer_highlight():
	if mixer_highlighted == false:
		water.mesh.surface_get_material(0).next_pass = HIGHLIGHT
		water.mesh.surface_get_material(1).next_pass = HIGHLIGHT
		water.mesh.surface_get_material(2).next_pass = HIGHLIGHT
		water.mesh.surface_get_material(3).next_pass = HIGHLIGHT

		sand1.mesh.surface_get_material(0).next_pass = HIGHLIGHT
		sand1.mesh.surface_get_material(1).next_pass = HIGHLIGHT
		sand1.mesh.surface_get_material(2).next_pass = HIGHLIGHT
		mixer_highlighted = true



#highlight the wedges
func _on_ray_cast_3d_wedge_highlight():
	if wedges_highlighted == false:
		wedge.mesh.surface_get_material(0).next_pass = HIGHLIGHT
		wedges_highlighted = true



