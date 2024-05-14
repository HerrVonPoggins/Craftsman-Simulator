extends Node2D

@onready var label_1 = $Panel/VBoxContainer/HBoxContainer/Label
@onready var label_2 = $Panel/VBoxContainer/HBoxContainer2/Label
@onready var label_3 = $Panel/VBoxContainer/HBoxContainer3/Label
@onready var label_4 = $Panel/VBoxContainer/HBoxContainer4/Label
@onready var label_5 = $Panel/VBoxContainer/HBoxContainer5/Label

@onready var check_1 = $Panel/VBoxContainer/HBoxContainer/CheckButton
@onready var check_2 = $Panel/VBoxContainer/HBoxContainer2/CheckButton
@onready var check_3 = $Panel/VBoxContainer/HBoxContainer3/CheckButton
@onready var check_4 = $Panel/VBoxContainer/HBoxContainer4/CheckButton
@onready var check_5 = $Panel/VBoxContainer/HBoxContainer5/CheckButton

#values for the checklist text and checkmarks
@export var check_state_1 = false
@export var check_state_2 = false
@export var check_state_3 = false
@export var check_state_4 = false
@export var check_state_5 = false

@export var label_text_1 = "Arbeitskleidung sammeln"
@export var label_text_2 = "Zement mischen"
@export var label_text_3 = "Richtschnur spannen"
@export var label_text_4 = "Mauer bauen"
@export var label_text_5 = "Tuersturz plazieren"



#functions to switch set the checklist details
func _process(delta):
	_check_1_on(check_state_1)
	_check_2_on(check_state_2)
	_check_3_on(check_state_3)
	_check_4_on(check_state_4)
	_check_5_on(check_state_5)
	_set_label_1_text(label_text_1)
	_set_label_2_text(label_text_2)
	_set_label_3_text(label_text_3)
	_set_label_4_text(label_text_4)
	_set_label_5_text(label_text_5)
	
	
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


func _check_1_on(check1state):
	check_1.button_pressed = check_state_1
	
func _check_2_on(check2state):
	check_2.button_pressed = check_state_2
	
func _check_3_on(check2state):
	check_3.button_pressed = check_state_3
	
func _check_4_on(check2state):
	check_4.button_pressed = check_state_3
	
func _check_5_on(check2state):
	check_5.button_pressed = check_state_3

