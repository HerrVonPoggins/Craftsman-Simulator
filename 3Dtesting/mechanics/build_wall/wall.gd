extends Node3D

@onready var brick_1 = $Brick1
@onready var brick_2 = $Brick2
@onready var brick_3 = $Brick3
@onready var outline_1 = $Area3D/Outline1
@onready var outline_2 = $Area3D/Outline2
@onready var outline_3 = $Area3D/Outline3
@onready var concrete_line_1 = false
@onready var concrete_line_2 = false
@onready var concrete_line_3 = false

@onready var minigame_1 = $"../Node3D5"
@onready var minigame_2 = $"../Node3D7"
@onready var minigame_3 = $"../Node3D8"

var counter = 0
#area3d makes the concrete visible when the trowel (with concrete on it) enters the zone
#switch between laying bricks and adding concrete

func _on_area_3d_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true:
		if counter == 0:
			
			counter = 0

	if Global.concrete_1 == true and counter == 0:
		concrete_line_1 = true
		Global.concrete = false
		counter = 1
	elif Global.concrete_2 == true and counter == 1:
		concrete_line_2 = true
		Global.concrete = false
		counter = 2
	elif Global.concrete_3 == true:
		concrete_line_3 = true
		Global.concrete = false


	if Global.placing_games_open == true:
		$Area3D/Outline1.visible = false
		$Area3D/Outline2.visible = false
		$Area3D/Outline3.visible = false

	elif Global.placing_games_open == false and $Brick1.visible == false:
		$Area3D/Outline1.visible = true
	elif Global.placing_games_open == false and $Brick2.visible == false and $Brick1.visible == true:
		$Area3D/Outline2.visible = true
	elif Global.placing_games_open == false and $Brick3.visible == false and $Brick2.visible == true:
		$Area3D/Outline3.visible = true

	if body.is_in_group("brick") == true and Global.string == true:
		
		if brick_1.visible == false and body.is_in_group("cut") == false and concrete_line_1 == true and counter == 1 :
			body.queue_free()
			Global.is_holding = false
			
			Global.brick_is_being_placed = true
			await get_tree().create_timer(0.5).timeout
			Global.brick_is_being_placed = false
			Music._play_brick_placing()
			brick_1.visible = true
			outline_1.visible = false
			outline_2.visible = true
			
		elif brick_2.visible == false and body.is_in_group("cut") == false and concrete_line_2 == true and counter == 2:
			body.queue_free()
			Global.is_holding = false
			Global.brick_is_being_placed = true
			await get_tree().create_timer(0.5).timeout
			Global.brick_is_being_placed = false
			Music._play_brick_placing()
			brick_2.visible = true
			outline_2.visible = false
			outline_3.visible = true

		elif brick_3.visible == false and body.is_in_group("cut") and outline_3.visible == true and concrete_line_3 == true:
			body.queue_free()
			Global.is_holding = false
			Music._play_brick_placing()
			Global.brick_is_being_placed = true
			await get_tree().create_timer(0.5).timeout
			Global.brick_is_being_placed = false
			brick_3.visible = true
			outline_3.visible = false
			DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/spirit_level_needed.dialogue"))





