extends Node2D

@onready var label1 = $Panel/VBoxContainer/HBoxContainer/Label
@onready var label2 = $Panel/VBoxContainer/HBoxContainer2/Label
@onready var label3 = $Panel/VBoxContainer/HBoxContainer3/Label
@onready var label4 = $Panel/VBoxContainer/HBoxContainer4/Label
@onready var label5 = $Panel/VBoxContainer/HBoxContainer5/Label

@onready var check1 = $Panel/VBoxContainer/HBoxContainer/CheckButton
@onready var check2 = $Panel/VBoxContainer/HBoxContainer2/CheckButton
@onready var check3 = $Panel/VBoxContainer/HBoxContainer3/CheckButton
@onready var check4 = $Panel/VBoxContainer/HBoxContainer4/CheckButton
@onready var check5 = $Panel/VBoxContainer/HBoxContainer5/CheckButton


@export var check1state = true
@export var check2state = false
@export var check3state = false
@export var check4state = false
@export var check5state = false

@export var label1text = "Ziegel saegen"
@export var label2text = "Zement mischen"
@export var label3text = "Mauer bauen"
@export var label4text = "Platzhalter"
@export var label5text = "Platzhalter"



#functions um häkchen und text zu bestimmen in anderen szenen

func _ready():
	pass
func _process(delta):
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

