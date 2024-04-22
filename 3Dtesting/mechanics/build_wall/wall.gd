extends Node3D

@onready var brick_1 = $Brick1
@onready var brick_2 = $Brick2
@onready var brick_3 = $Brick3
@onready var outline_1 = $Area3D/Outline1
@onready var outline_2 = $Area3D/Outline2
@onready var outline_3 = $Area3D/Outline3
@onready var concrete_line_1 = $Area3D/Concrete1
@onready var concrete_line_2 = $Area3D/Concrete2
@onready var concrete_line_3 = $Area3D/Concrete3

var counter = 0
#area3d makes the concrete visible when the trowel (with concrete on it) enters the zone
#switch between laying bricks and adding concrete-

func _on_area_3d_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true:
		if counter == 0:
			concrete_line_1.visible = true
			Global.concrete = false
			counter = 1
	elif concrete_line_1.visible == true and counter == 1 and brick_1.visible == true and Global.concrete == true:
		concrete_line_2.visible = true
		Global.concrete = false
		counter = 2
	elif outline_3.visible == true and counter == 2 and brick_2.visible == true and Global.concrete == true:
		concrete_line_3.visible = true
		Global.concrete = false
	
	if body.is_in_group("brick") == true and Global.isolation == true:
		
		if brick_1.visible == false and body.is_in_group("cut") == false and concrete_line_1.visible == true and counter == 1 :
			body.queue_free()
			brick_1.visible = true
			outline_1.visible = false
			outline_2.visible = true
			
		elif brick_2.visible == false and body.is_in_group("cut") == false and concrete_line_2.visible == true and counter == 2:
			body.queue_free()
			brick_2.visible = true
			outline_2.visible = false
			outline_3.visible = true

		elif brick_3.visible == false and body.is_in_group("cut") and outline_3.visible == true and concrete_line_3.visible == true:
			body.queue_free()
			brick_3.visible = true
			outline_3.visible = false
			Global.wall_finished = true
			#DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/schlusstext.dialogue"))

