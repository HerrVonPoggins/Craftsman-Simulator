extends Control

@onready var label_1 = $VBoxContainer2/HBoxContainer/Label
@onready var label_2 = $VBoxContainer2/HBoxContainer2/Label
@onready var label_3 = $VBoxContainer2/HBoxContainer3/Label
@onready var label_4 = $VBoxContainer2/HBoxContainer4/Label
@onready var label_5 = $VBoxContainer2/HBoxContainer5/Label
@onready var label_6 = $VBoxContainer2/HBoxContainer6/Label

@onready var check_1 = $VBoxContainer2/HBoxContainer/CheckButton
@onready var check_2 = $VBoxContainer2/HBoxContainer2/CheckButton
@onready var check_3 = $VBoxContainer2/HBoxContainer3/CheckButton
@onready var check_4 = $VBoxContainer2/HBoxContainer4/CheckButton
@onready var check_5 = $VBoxContainer2/HBoxContainer5/CheckButton
@onready var check_6 = $VBoxContainer2/HBoxContainer6/CheckButton

#values for the checklist text and checkmarks
@export var check_state_1 = false
@export var check_state_2 = false
@export var check_state_3 = false
@export var check_state_4 = false
@export var check_state_5 = false
@export var check_state_6 = false

@export var label_text_1 = "Helm, Schuche, Handschuhe
gesammelt
 "
@export var label_text_2 = "Wasser, Moertel und Sand in den Mischer gefeullt
 
"
@export var label_text_3 = "Zwei Keile gesetzt und Richtschnur gespannt
 "
@export var label_text_4 = "Eimer zum blinkenden Platz bringen, Kelle in Eimer getaucht, Moertel 3x auf die markierten Flaechen gestrichen, Wasserwaage an Ziegelreihe, Ziegel gerade geklopft
 "
@export var label_text_5 = "Stürze an Türen angebracht
 "
@export var label_text_6 = "Deckenstuetzen aufgestellt
Kran am LKW (E) gestartet  Deckenplatten verlegt
"

var opened = true

#func _ready():
	#$InteractionPlayer.play("interaction_popup_talk_intro")
	#await $InteractionPlayer.animation_finished
	#$InteractionPlayer.play("interaction_popup_talk_quit")
#functions to switch set the checklist details
func _process(_delta):
	
	if Global.crosshair_off == true:
		$HBoxContainer.hide()
		$Label.hide()
	
	if Global.checklist_hide == true:
		$".".hide()
	elif Global.checklist_hide == false:
		$".".show()
	
	_check_1_on(check_state_1)
	_check_2_on(check_state_2)
	_check_3_on(check_state_3)
	_check_4_on(check_state_4)
	_check_5_on(check_state_5)
	_check_6_on(check_state_6)
	_set_label_1_text(label_text_1)
	_set_label_2_text(label_text_2)
	_set_label_3_text(label_text_3)
	_set_label_4_text(label_text_4)
	_set_label_5_text(label_text_5)
	_set_label_6_text(label_text_6)
	
	
	
	if Input.is_action_just_pressed("list"):
		if opened == true:
			$QuestPlayer.play("Quest_revert")
			opened = false
		elif opened == false:
			$QuestPlayer.play("Quest_expand")
			opened = true
			
			
	#func to play the animation to tell the player he can interact

func _play_interactable():
	$InteractionPlayer.play("interaction_popup_pickup_intro")
func _quit_interactable():
	$InteractionPlayer.play("interaction_popup_pickup_quit")
	
func _play_talkable():
	$InteractionPlayer.play("interaction_popup_talk_intro")
func _quit_talkable():
	$InteractionPlayer.play("interaction_popup_talk_quit")

func _play_activateable():
	$InteractionPlayer.play("activateable_popup_talk_intro")
func _quit_activatekable():
	$InteractionPlayer.play("activateable_popup_talk_quit")

func _set_label_1_text(string):
	label_1.set_text(string)
func _set_label_2_text(string):
	label_2.set_text(string)
func _set_label_3_text(string):
	label_3.set_text(string)
func _set_label_4_text(string):
	label_4.set_text(string)
func _set_label_5_text(string):
	label_5.set_text(string)
func _set_label_6_text(string):
	label_6.set_text(string)

func _check_1_on(check1state):
	check_1.button_pressed = check_state_1
	
func _check_2_on(check2state):
	check_2.button_pressed = check_state_2
	
func _check_3_on(check2state):
	check_3.button_pressed = check_state_3
	
func _check_4_on(check2state):
	check_4.button_pressed = check_state_4
	
func _check_5_on(check2state):
	check_5.button_pressed = check_state_5

func _check_6_on(check2state):
	check_6.button_pressed = check_state_6
	
func _movement_visual():
	$KeyboardArrowsHorizontal.visible = true
	$KeyboardArrowsVertical.visible = true

func _crouch_visual():
	$KeyboardCOutline.visible = true

func _interact_visual():
	$KeyboardEOutline.visible = true

func _sprint_visual():
	$KeyboardShift.visible = true

func _reset_visual():
	$KeyboardUOutline.visible = true

func _mouse_left_visual():
	$MouseLeft.visible = true

func _mouse_right_visual():
	$MouseRight.visible = true


func _movement_visual_hide():
	$KeyboardArrowsHorizontal.visible = false
	$KeyboardArrowsVertical.visible = false

func _crouch_visual_hide():
	$KeyboardCOutline.visible = false

func _interact_visual_hide():
	$KeyboardEOutline.visible = false

func _sprint_visual_hide():
	$KeyboardShift.visible = false

func _reset_visual_hide():
	$KeyboardUOutline.visible = false

func _mouse_left_visual_hide():
	$MouseLeft.visible = false

func _mouse_right_visual_hide():
	$MouseRight.visible = false
