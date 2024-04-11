extends Node2D

@onready var label1 = $Panel/VBoxContainer/Label
@onready var label2 = $Panel/VBoxContainer/Label3
@onready var label3 = $Panel/VBoxContainer/Label5
@onready var check1 = $Panel/VBoxContainer/Label/CheckButton
@onready var check2 = $Panel/VBoxContainer/Label3/CheckBox
@onready var check3 = $Panel/VBoxContainer/Label5/CheckBox
@export var check1state = false
@export var check2state = false
@export var check3state = false
@export var label1text = "mauer bauen"
@export var label2text = "zement mischen"
@export var label3text = "test"


#functions um häkchen und text zu bestimmen in anderen szenen

func _ready():
	
	check1on(check1state)
	check2on(check2state)
	check3on(check3state)
	set_label1_text(label1text)
	set_label2_text(label2text)
	set_label3_text(label3text)


func set_label1_text(string):
	label1.set_text(string)
func set_label2_text(string):
	label2.set_text(string)
func set_label3_text(string):
	label3.set_text(string)


func check1on(check1state):
	check1.button_pressed = check1state
	
func check2on(check2state):
	check2.button_pressed = check2state
	
func check3on(check2state):
	check3.button_pressed = check2state

func _on_button_pressed():
	if $Panel.visible == false:
		$Panel.visible = true

	else:
		$Panel.visible = false
		
