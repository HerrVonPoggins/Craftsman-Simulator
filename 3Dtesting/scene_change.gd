extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.checklist_hide = true
	$Enter/Label2.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Enter.play("fade_in")
	await $Enter.animation_finished
	$Sun.play("sun_down")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.current_scene == 1:
		$House.visible = false
	
	
	
	if Global.current_scene == 2:
		$House.visible = true
		$"house_anim_1(1)".visible = false
		$"house_anim_2(1)".visible = false
		$"house_anim_3(1)".visible = false
		$house_base.visible = false
		$"Root Scene".visible = false

func _on_button_pressed():
	if Global.current_scene == 1:
		$Sun.play_backwards("sun_down")
		await $Sun.animation_finished
		
		$Transition._change_scene_day_1("res://scenes/Carpenter/carpenter_world.tscn")
		Global.checklist_hide = false
		
	elif Global.current_scene == 2:
		$Sun.play_backwards("sun_down")
		await $Sun.animation_finished
		$Enter/Label2.text = "Tag 3"

		$Transition._change_scene_day_2("res://scenes/ElektrikerScene/Elektriker.tscn")
		Global.checklist_hide = false
