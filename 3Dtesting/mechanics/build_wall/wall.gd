extends Node3D

@onready var brick_1 = $Brick1
@onready var brick_2 = $Brick2
@onready var brick_3 = $Brick3
@onready var brick_4 = $Brick4
@onready var brick_5 = $Brick5
@onready var brick_6 = $Brick6
@onready var brick_7 = $Brick7
@onready var brick_8 = $Brick8
@onready var brick_9 = $Brick9
@onready var brick_10 = $Brick10
@onready var brick_11 = $Brick11
@onready var brick_12 = $Brick12
@onready var brick_13 = $Brick13
@onready var brick_14 = $Brick14
@onready var brick_15 = $Brick15
@onready var brick_16 = $Brick16
@onready var brick_17 = $Brick17
@onready var brick_18 = $Brick18
@onready var brick_19 = $Brick19
@onready var brick_20 = $Brick20

@onready var outline_1 = $Area3D/Outline1
@onready var outline_2 = $Area3D/Outline2
@onready var outline_3 = $Area3D/Outline3
@onready var outline_4 = $Area3D/Outline4
@onready var outline_5 = $Area3D/Outline5
@onready var outline_6 = $Area3D/Outline6
@onready var outline_7 = $Area3D/Outline7
@onready var outline_8 = $Area3D/Outline8
@onready var outline_9 = $Area3D/Outline9
@onready var outline_10 = $Area3D/Outline10
@onready var outline_11 = $Area3D/Outline11
@onready var outline_12 = $Area3D/Outline12
@onready var outline_13 = $Area3D/Outline13
@onready var outline_14 = $Area3D/Outline14
@onready var outline_15 = $Area3D/Outline15
@onready var outline_16 = $Area3D/Outline16
@onready var outline_17 = $Area3D/Outline17
@onready var outline_18 = $Area3D/Outline18
@onready var outline_19 = $Area3D/Outline19
@onready var outline_20 = $Area3D/Outline20

var concrete_line_1 = false
var concrete_line_2 = false
var concrete_line_3 = false

@onready var minigame_1 = $"../Node3D5"
@onready var minigame_2 = $"../Node3D7"
@onready var minigame_3 = $"../Node3D8"

var counter = -1
#area3d makes the concrete visible when the trowel (with concrete on it) enters the zone
#switch between laying bricks and adding concrete

func _on_area_3d_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true:
		counter += 1

	if Global.concrete_amount == 1 and counter == 0:
		concrete_line_1 = true
		Global.concrete = false
	elif Global.concrete_amount == 2 and counter == 1:
		concrete_line_2 = true
		Global.concrete = false
	elif Global.concrete_amount == 3 and counter == 2:
		concrete_line_3 = true
		Global.concrete = false
	elif Global.concrete_amount >= 4 and counter >= 3:
		Global.concrete = false


	if body.is_in_group("brick") == true and Global.string == true:
		
		if brick_1.visible == false and body.is_in_group("cut") == false and concrete_line_1 == true and counter == 1 :
			body.queue_free()
			
			Global.brick_is_being_placed = true
			await get_tree().create_timer(0.5).timeout
			Global.brick_is_being_placed = false
			Music._play_brick_placing()
			brick_1.visible = true
			outline_1.visible = false
			outline_2.visible = true
			
		elif brick_2.visible == false and body.is_in_group("cut") == false and concrete_line_2 == true and counter == 2:
			body.queue_free()
			Global.brick_is_being_placed = true
			await get_tree().create_timer(0.5).timeout
			Global.brick_is_being_placed = false
			Music._play_brick_placing()
			brick_2.visible = true
			outline_2.visible = false
			outline_3.visible = true

		elif brick_3.visible == false and body.is_in_group("cut") and outline_3.visible == true and concrete_line_3 == true:
			body.queue_free()
			Music._play_brick_placing()
			Global.brick_is_being_placed = true
			await get_tree().create_timer(0.5).timeout
			Global.brick_is_being_placed = false
			brick_3.visible = true
			outline_3.visible = false
			DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/spirit_level_needed.dialogue"))




