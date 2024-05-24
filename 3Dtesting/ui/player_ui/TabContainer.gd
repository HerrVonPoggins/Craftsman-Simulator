extends Control

var isOpen:bool = false
signal opened
signal closed


@onready var check = $checklist
@onready var info_hub_button = $ButtonInfoHub
@onready var checklist_button = $ButtonChecklist
@onready var tab = $TabContainer
@onready var settings = $ButtonSettings
@onready var save = $ButtonSave
@onready var load = $ButtonLoad
@onready var main_menu = $ButtonMainMenu
@onready var quit = $ButtonQuit




func _ready():
	close()
	#$"TabContainer/1/MaurerText".append_text("[color=#ffff00]this text is white[/color]")



#sets the checkmarks of the checklist
func _process(delta):
	if Global.tutorial_finished == true:
		$Panel.visible = false
		
		
	if Global.wall_finished == true:
		check.check_state_4 = true
	if Global.concrete_mixed == true:
		check.check_state_2 = true
	if Global.door_top == 2 and Global.window_top == 4:
		check.check_state_5 = true
	if Global.tutorial_finished == true:
		check.check_state_1 = true
	if Global.string == true:
		check.check_state_3 = true
	
	#sets the open/closemechanic on the escape button
	if Input.is_action_just_pressed("escape"):
		if isOpen == true:
			close()
			checklist_button.visible = false
			info_hub_button.visible = false
			settings.visible = false
			save.visible = false
			load.visible = false
			main_menu.visible = false
			quit.visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		else:
			open()
			info_hub_button.visible = true
			checklist_button.visible = true
			settings.visible = true
			save.visible = true
			load.visible = true
			main_menu.visible = true
			quit.visible = true
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
	Music._play_button()
	if isOpen == true:
		close()
		info_hub_button.visible = false
		checklist_button.visible = false
		settings.visible = false
		save.visible = false
		load.visible = false
		main_menu.visible = false
		quit.visible = false
	else:
		open()

func _on_button_checklist_pressed():
	Music._play_button()
	if check.visible == false:
		check.visible = true
	else:
		check.visible = false





func _on_button_main_menu_pressed():
	Music._play_button()
	$Transition._change_scene("res://ui/screens/titlescreen.tscn")
	close()
	

func _on_button_save_pressed():
	Music._play_button()
	Global.save()

func _on_button_load_pressed():
	Music._play_button()
	Global.load_save()
	if Global.current_scene == 1:
		$Transition._change_scene("res://scenes/CorePlayable/CorePlayable.tscn")
	elif Global.current_scene == 2:
		$Transition._change_scene("res://scenes/StuckateurScene/Stuckateur.tscn")

func _on_button_settings_pressed():
	Music._play_button()
	$Control.visible = true


func _on_button_quit_pressed():
	get_tree().quit()






