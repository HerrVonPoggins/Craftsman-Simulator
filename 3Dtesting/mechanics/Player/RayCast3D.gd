extends RayCast3D

var last = Vector3.ZERO
var obj = null

var trowel_collider = null


signal start_saw_minigame

@onready var point = $"../MeshInstance3D/Hold"
@onready var player = $"../../../.."
var work_clothes = 0

#The Raycast shoots a laser for a fixed range, on collision with something we can get the object  and check if it is in group "grab"
#a object in group "grab" will then fixed on the hold point of the character until we release it.
func _process(delta):
	if work_clothes == 3:
		Global.tutorial_finished = true


	if Input.is_action_just_pressed("interagieren"):
		if obj == null:
			var collider = get_collider()
			if collider != null:
				if collider.is_in_group("grab"):
					obj = collider
				if collider.is_in_group("trowel"):
					trowel_collider = collider
					Global.trowel_picked = true

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
				if collider.is_in_group("cement_mixer") and Global.dialogue_open == false:
					Music._play_mixer()
					player.emit_signal("start_mixer")
					DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_step_2.dialogue"))

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


	if obj != null:
		last = obj.global_position
		obj.position = point.global_position
		if obj.is_class("RigidBody3D"):
			obj.linear_velocity = Vector3.ZERO
			obj.look_at($"../VisionCenter".global_position)


	else:
		if obj != null:
			if obj.is_class("RigidBody3D"):
				var velocity = obj.position - last
				obj.linear_velocity = velocity * 100
		obj = null

#rightclick to release object
	if Input.is_action_pressed("rightclick"):
		obj = null

	if Global.let_go == true:
		obj = null
		Global.let_go = false

func _on_player_concrete_bucket_pos_reached():
	obj = null



func _on_player_inv_trowel_button_clicked():
	if obj == null:
		obj = trowel_collider
	elif obj != null:
		obj = null

func _on_player_delete_sand_container():
	if obj != null:
		obj.queue_free()
