extends Node3D
var generator_on = 0
var played = false
var played2 = false
var played3 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Checklist._movement_visual()
	Checklist._sprint_visual()
	Checklist._crouch_visual()
	$Props/Saw/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
	
	Global.current_scene = 3
	Global.walking_on = $"Map/map/Boden modified/StaticBody3D"
	$Enter.play("fade_in")
	Global.ground_grass = $"Map/map/Boden modified/StaticBody3D".get_instance_id()
	DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/elektriker_intro.dialogue"))
	await get_tree().create_timer(5).timeout
	Checklist._movement_visual_hide()
	Checklist._sprint_visual_hide()
	Checklist._crouch_visual_hide()
	
	Checklist._mouse_left_visual()
	Checklist._interact_visual()
	Checklist._mouse_right_visual()
	await get_tree().create_timer(5).timeout
	Checklist._interact_visual_hide()
	Checklist._mouse_right_visual_hide()
	Checklist._mouse_left_visual_hide()


func _on_control_opened():
	get_tree().paused = true


func _on_control_closed():
	get_tree().paused = false


func _process(delta):
	
	#if Input.is_action_just_pressed("kamera"):
		#Global.can_power = 2
	
	
	if Global.wall_sawed == true and played2 == false:
		played2 = true
		$Props/Outlet/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Outlet2/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Cable/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Cable2/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		Global.electric_checkstate += 1
		
		
	
	if Global.wall_sawed == true and played == false:
		played = true
		$Props/Plaster/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		$Props/Water/Mesh.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		
		$Plaster.visible = true
	
	if Global.generator_on == 3 and played3 == false:
		played3 = true
		$checklist.check_6.visible = false
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/elektriker_step_5.dialogue"))
		await get_tree().create_timer(5).timeout
		$Transition._change_scene("res://UI/screens/endscreen.tscn")








