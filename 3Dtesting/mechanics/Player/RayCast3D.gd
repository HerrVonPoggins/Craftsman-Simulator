extends RayCast3D

signal mixer_highlight
signal wedge_highlight
signal start_saw_minigame
signal start_dübel_minigame

var mat1 = load("res://assets/textures/material_white.tres")
var last = Vector3.ZERO
var obj = null
var temp = null
var was_shiny = false

var trowel_collider = null
var spirit_level_collider = null




@onready var animation_arms = $"../../../../Root Scene/AnimationPlayer"
@onready var point = $"../Root Scene3/RootNode/metarig/Skeleton3D/BoneAttachment3D/Hold"
@onready var player = $"../../../.."

var work_clothes = 0
var interactable_is_open = false
var talkable_is_open = false
var activate_is_open = false
#The Raycast shoots a laser for a fixed range, on collision with something we can get the object  and check if it is in group "grab"
#a object in group "grab" will then fixed on the hold point of the character until we release it.
func _process(delta):
	#if obj == null:
		#Global.is_holding = false
		#Global.can_extend = false
	if obj != null:
		if Global.player_visibility == false:
			obj.visible = false
		elif Global.player_visibility == true:
			obj.visible = true
#plays the brickplaceing animation when the var becomes true 
	if Global.brick_is_being_placed == true:
		_place_brick()
	

	
	#starts the interactable animation if hovered over the right objects
	if Global.press_e == true and obj == null and get_collider() != null: 
		if interactable_is_open == false and Global.crosshair_off == false:
			Checklist._play_interactable()
			interactable_is_open = true
	else:
		if interactable_is_open == true:
			Checklist._quit_interactable()
			interactable_is_open = false


	if Global.talkable == true and obj == null and get_collider() != null: 
		if talkable_is_open == false and Global.crosshair_off == false:
			Checklist._play_talkable()
			talkable_is_open = true
	else:
		if talkable_is_open == true:
			Checklist._quit_talkable()
			talkable_is_open = false

	if Global.activateable == true and obj == null and get_collider() != null: 
		if activate_is_open == false and Global.crosshair_off == false:
			Checklist._play_activateable()
			activate_is_open = true
	else:
		if activate_is_open == true:
			Checklist._quit_activatekable()
			activate_is_open = false

	#makes objects slight transparent when hovered over useable object
	if obj == null:
		var collider = get_collider()
		if collider != null:
			
			if collider.is_in_group("use"):
				Global.press_e = true
			else:
				Global.press_e = false

			if collider.is_in_group("talkable"):
				Global.talkable = true
			else:
				Global.talkable = false

			if collider.is_in_group("activate"):
				Global.activateable = true
			else:
				Global.activateable = false


	#sets the tutorial finished once the clothes are collected
	if work_clothes == 3:
		Global.tutorial_finished = true

#picks up item and starts the pick up animation
	if Input.is_action_just_pressed("interagieren"):
		if obj == null:
			var collider = get_collider()
			if collider != null:
				if collider.is_in_group("grab"):
					Global.is_holding = true
					$"../Root Scene3/AnimationPlayer".play("metarig|grab")
					await $"../Root Scene3/AnimationPlayer".animation_finished
					await get_tree().create_timer(0.1).timeout
					
					
					if collider.is_in_group("can_extend"):
						Global.can_extend = true
					if collider.is_in_group("bucket"):
						Global.holding_bucket = true
					if collider.is_in_group("brick"):
						Global.holding_bricks = true
					if collider.is_in_group("bag"):
						Global.holding_bag = true



					obj = collider
				if collider.is_in_group("trowel"):
					trowel_collider = collider
					Global.trowel_picked = true
				if collider.is_in_group("spirit_level"):
					spirit_level_collider = collider
					Global.spirit_level_picked = true

	#The Raycast shoots a laser for a fixed range, on collision with something we can get the object and check if it is in group "npc"
	#if we press interact(E) while focused on the npc the mouse pointer becomes visible again and a dialogue will bes started
	if Input.is_action_just_pressed("interagieren"):
		if obj == null:
			var collider = get_collider()
			if collider != null:
				if collider.is_in_group("npc") and Global.dialogue_open == false:
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/bauleiter_maurer.dialogue"))

				if collider.is_in_group("maurer") and Global.dialogue_open == false:
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_text.dialogue"))
					emit_signal("mixer_highlight")

				if collider.is_in_group("cement_mixer") and Global.dialogue_open == false:
					Music._play_mixer()
					player.emit_signal("start_mixer")
					emit_signal("wedge_highlight")
					DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_2.dialogue"))

				if collider.is_in_group("truck") and Global.can_make_roof == true:
					
					Global.crane_on = true
				if collider.is_in_group("helmet"):
					collider.queue_free()
					Music._play_collect()
					work_clothes += 1
				if collider.is_in_group("gloves"):
					collider.queue_free()
					Music._play_collect()
					work_clothes += 1
				if collider.is_in_group("boots"):
					collider.queue_free()
					Music._play_collect()
					work_clothes += 1

				if collider.is_in_group("saw_minigame"):
					emit_signal("start_saw_minigame")
				if collider.is_in_group("rod_extend"):
					collider.scale = Vector3(1,1.35,1)
				if collider.is_in_group("curcuit_minigame") and Global.can_power >= 2:
					Global.curcuit_minigame_on = true
				if collider.is_in_group("switch_minigame") and Global.can_power >= 2:
					Global.switch_minigame_on = true
				if collider.is_in_group("plaster_mixer"):
					Global.plaster_mixing = true
				if collider.is_in_group("power_box") and Global.can_power >= 2:
					Global.power_box = true
				if collider.is_in_group("open"):
					print(collider.open)
					if collider.open == false:
						collider.open = true
					else:
						collider.open = false

				if collider.is_in_group("wallguide"):
					emit_signal("start_dübel_minigame")
				if collider.is_in_group("filler_pump"):
					Global.filler_started = true

	if obj != null:

		last = obj.global_position
		obj.position = point.global_position
		if obj.is_class("RigidBody3D"):
			if obj.get_node("Mesh").material_overlay != null:
				was_shiny = true
			obj.get_node("Mesh").set_deferred("material_overlay", null)
			temp = obj.get_node("Mesh")
			obj.linear_velocity = Vector3.ZERO
			obj.look_at($"../VisionCenter".global_position)


	else:
		if obj != null:
			if obj.is_class("RigidBody3D"):
				var velocity = obj.position - last
				obj.linear_velocity = velocity * 100
				
		obj = null
		
#rightclick to release object
	if Input.is_action_just_pressed("rightclick"):
		if was_shiny == true and obj != null:
			temp.set_deferred("material_overlay", load("res://assets/shader/shiniy_shader_material.tres"))
		temp = null
		was_shiny = false
		Global.can_extend = false
		$"../Root Scene3/AnimationPlayer".play("Idle_Walking")
		Global.is_holding = false
		obj = null

	if Global.let_go == true:
		obj = null
		Global.let_go = false

#InvButtons activated through number on keyboard instead of mouse
	if Input.is_action_just_pressed("TrowelButton"):
		if obj == null:
			obj = trowel_collider
			Global.can_extend = true
			Global.is_holding = true
	if Input.is_action_just_pressed("SpiritLevelButton"):
		if obj == null:
			obj = spirit_level_collider
			Global.can_extend = true
			Global.is_holding = true

func _on_player_concrete_bucket_pos_reached():
	obj = null

func _on_player_delete_sand_container():
	if obj != null:
		obj.queue_free()
		Global.can_extend = false
		Global.is_holding = false

#func to play animation
func _place_brick():
	$"../../../../Root Scene/AnimationPlayer".play("metarig|place brick")
	
	#generic animations
func _play_grab():
	animation_arms.play("GrabAction_001")
func _play_stand():
	animation_arms.play("Idle_Standing_Still_002")
func _play_walk():
	animation_arms.play("Idle_Walking")
func _play_bucket_out():


#animations for bag and bucket
	animation_arms.play("metarig|get bucket out")
func _play_bag_out():
	animation_arms.play("metarig|get sand sack out")
func _play_bucket_away():
	animation_arms.play("metarig|put bucket away")
func _play_bag_away():
	animation_arms.play("metarig|put sand sack away")
func _play_bag_forward():
	animation_arms.play("metarig|sack in ruehrding")
func _play_bag_back():
	animation_arms.play("metarig|sack aus rührding")
func _play_bucket_stand():
	animation_arms.play("metarig|idle standing bucket")
func _play_bucket_walk():
	animation_arms.play("metarig|idle walking bucket")
func _play_bag_stand():
	animation_arms.play("metarig|idle standing sack")
func _play_bag_walk():
	animation_arms.play("metarig|idle walking sack")
