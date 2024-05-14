extends Control

var isOpen:bool = false
signal opened
signal closed


@onready var check = $checklist
@onready var info_hub_button = $ButtonInfoHub
@onready var checklist_button = $ButtonChecklist
@onready var tab = $TabContainer





func _ready():
	close()
	#$"TabContainer/1/MaurerText".append_text("[color=#ffff00]this text is white[/color]")



#sets the checkmarks of the checklist
func _process(delta):
	if Global.tutorial_finished == true:
		$Panel.visible = false
		
	if Global.wall_finished == true:
		check.check_state_3 = true
	if Global.concrete_mixed == true:
		check.check_state_2 = true
	if Global.brick_sawed == true:
		check.check_state_1 = true
	
	#sets the open/closemechanic on the escape button
	if Input.is_action_just_pressed("escape"):
		if isOpen == true:
			close()
			checklist_button.visible = false
			info_hub_button.visible = false
			$ButtonSettings.visible = false
			$ButtonSave.visible = false
			$ButtonLoad.visible = false
			$ButtonMainMenu.visible = false
			$ButtonQuit.visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		else:
			open()
			info_hub_button.visible = true
			checklist_button.visible = true
			$ButtonSettings.visible = true
			$ButtonSave.visible = true
			$ButtonLoad.visible = true
			$ButtonMainMenu.visible = true
			$ButtonQuit.visible = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func open():
	tab.visible = true
	isOpen = true
	opened.emit()

func close():
	tab.visible = false
	isOpen = false
	closed.emit()

func _on_button_info_hub_pressed():
	if isOpen == true:
		close()
		info_hub_button.visible = false
		checklist_button.visible = false
		$ButtonSettings.visible = false
		$ButtonSave.visible = false
		$ButtonLoad.visible = false
		$ButtonMainMenu.visible = false
		$ButtonQuit.visible = false
	else:
		open()

func _on_button_checklist_pressed():
	if check.visible == false:
		check.visible = true
	else:
		check.visible = false





func _on_button_main_menu_pressed():
	$Transition._change_scene("res://ui/screens/titlescreen.tscn")
	close()
	

func _on_button_save_pressed():
	Global.save()

func _on_button_load_pressed():
	Global.load_save()
	if Global.current_scene == 1:
		$Transition._change_scene("res://scenes/CorePlayable/CorePlayable.tscn")
	elif Global.current_scene == 2:
		$Transition._change_scene("res://scenes/StuckateurScene/Stuckateur.tscn")

func _on_button_settings_pressed():
	$Control.visible = true


func _on_button_quit_pressed():
	get_tree().quit()






