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

var counter = 0
#area3d makes the concrete visible when the trowel (with concrete on it) enters the zone
#switch between laying bricks and adding concrete-

func _on_area_3d_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true:
		if counter == 0:
			counter = 0

	if $Area3D/SmallConcrete/MeshInstance3D.visible == true and $Area3D/SmallConcrete8/MeshInstance3D.visible == true and counter == 0:
		concrete_line_1 = true
		Global.concrete = false
		counter = 1
	elif $Area3D/SmallConcrete9/MeshInstance3D.visible == true and $Area3D/SmallConcrete16/MeshInstance3D.visible == true and counter == 1:
		concrete_line_2 = true
		Global.concrete = false
		counter = 2
	elif $Area3D/SmallConcrete17/MeshInstance3D.visible == true and $Area3D/SmallConcrete20/MeshInstance3D.visible == true:
		concrete_line_3 = true
		Global.concrete = false

	if body.is_in_group("brick") == true and Global.isolation == true and Global.string == true:
		
		if brick_1.visible == false and body.is_in_group("cut") == false and concrete_line_1 == true and counter == 1 :
			body.queue_free()
			brick_1.visible = true
			outline_1.visible = false
			outline_2.visible = true
			
		elif brick_2.visible == false and body.is_in_group("cut") == false and concrete_line_2 == true and counter == 2:
			body.queue_free()
			brick_2.visible = true
			outline_2.visible = false
			outline_3.visible = true

		elif brick_3.visible == false and body.is_in_group("cut") and outline_3.visible == true and concrete_line_3 == true:
			body.queue_free()
			brick_3.visible = true
			outline_3.visible = false
	if body.is_in_group("spirit_level") and brick_3.visible == true:
		body.queue_free()
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/spirit_level_needed.dialogue"))
		Global.wall_finished = true



func _on_small_concrete_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and outline_1.visible == true:
		$Area3D/SmallConcrete/MeshInstance3D.visible = true
func _on_small_concrete_2_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and outline_1.visible == true:
		$Area3D/SmallConcrete2/MeshInstance3D.visible = true
func _on_small_concrete_3_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and outline_1.visible == true:
		$Area3D/SmallConcrete3/MeshInstance3D.visible = true
func _on_small_concrete_4_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and outline_1.visible == true:
		$Area3D/SmallConcrete4/MeshInstance3D.visible = true
func _on_small_concrete_5_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and outline_1.visible == true:
		$Area3D/SmallConcrete5/MeshInstance3D.visible = true
func _on_small_concrete_6_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and outline_1.visible == true:
		$Area3D/SmallConcrete6/MeshInstance3D.visible = true
func _on_small_concrete_7_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and outline_1.visible == true:
		$Area3D/SmallConcrete7/MeshInstance3D.visible = true
func _on_small_concrete_8_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and outline_1.visible == true:
		$Area3D/SmallConcrete8/MeshInstance3D.visible = true


func _on_small_concrete_9_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and concrete_line_1 == true and outline_2.visible == true:
		$Area3D/SmallConcrete9/MeshInstance3D.visible = true
func _on_small_concrete_10_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and concrete_line_1 == true and outline_2.visible == true:
		$Area3D/SmallConcrete10/MeshInstance3D.visible = true
func _on_small_concrete_11_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and concrete_line_1 == true and outline_2.visible == true:
		$Area3D/SmallConcrete11/MeshInstance3D.visible = true
func _on_small_concrete_12_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and concrete_line_1 == true and outline_2.visible == true:
		$Area3D/SmallConcrete12/MeshInstance3D.visible = true
func _on_small_concrete_13_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and concrete_line_1 == true and outline_2.visible == true:
		$Area3D/SmallConcrete13/MeshInstance3D.visible = true
func _on_small_concrete_14_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and concrete_line_1 == true and outline_2.visible == true:
		$Area3D/SmallConcrete14/MeshInstance3D.visible = true
func _on_small_concrete_15_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and concrete_line_1 == true and outline_2.visible == true:
		$Area3D/SmallConcrete15/MeshInstance3D.visible = true
func _on_small_concrete_16_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and concrete_line_1 == true and outline_2.visible == true:
		$Area3D/SmallConcrete16/MeshInstance3D.visible = true


func _on_small_concrete_17_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and concrete_line_2 == true and outline_3.visible == true:
		$Area3D/SmallConcrete17/MeshInstance3D.visible = true
func _on_small_concrete_18_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true and concrete_line_2 == true and outline_3.visible == true:
		$Area3D/SmallConcrete18/MeshInstance3D.visible = true
func _on_small_concrete_19_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true  and concrete_line_2 == true and outline_3.visible == true:
		$Area3D/SmallConcrete19/MeshInstance3D.visible = true
func _on_small_concrete_20_body_entered(body):
	if body.is_in_group("trowel") and Input.is_action_pressed("leftclick") and Global.concrete == true  and concrete_line_2 == true and outline_3.visible == true:
		$Area3D/SmallConcrete20/MeshInstance3D.visible = true





func _on_area_3d_body_exited(body):
	if body.is_in_group("trowel"):
		if $Area3D/SmallConcrete/MeshInstance3D.visible == false or $Area3D/SmallConcrete8/MeshInstance3D.visible == false:
			$Area3D/SmallConcrete/MeshInstance3D.visible = false
			$Area3D/SmallConcrete2/MeshInstance3D.visible = false
			$Area3D/SmallConcrete3/MeshInstance3D.visible = false
			$Area3D/SmallConcrete4/MeshInstance3D.visible = false
			$Area3D/SmallConcrete5/MeshInstance3D.visible = false
			$Area3D/SmallConcrete6/MeshInstance3D.visible = false
			$Area3D/SmallConcrete7/MeshInstance3D.visible = false
			$Area3D/SmallConcrete8/MeshInstance3D.visible = false
		elif $Area3D/SmallConcrete9/MeshInstance3D.visible == false or $Area3D/SmallConcrete16/MeshInstance3D.visible == false:
			$Area3D/SmallConcrete9/MeshInstance3D.visible = false
			$Area3D/SmallConcrete10/MeshInstance3D.visible = false
			$Area3D/SmallConcrete11/MeshInstance3D.visible = false
			$Area3D/SmallConcrete12/MeshInstance3D.visible = false
			$Area3D/SmallConcrete13/MeshInstance3D.visible = false
			$Area3D/SmallConcrete14/MeshInstance3D.visible = false
			$Area3D/SmallConcrete15/MeshInstance3D.visible = false
			$Area3D/SmallConcrete16/MeshInstance3D.visible = false
		elif $Area3D/SmallConcrete17/MeshInstance3D.visible == false or $Area3D/SmallConcrete20/MeshInstance3D.visible == false:
			$Area3D/SmallConcrete17/MeshInstance3D.visible = false
			$Area3D/SmallConcrete18/MeshInstance3D.visible = false
			$Area3D/SmallConcrete19/MeshInstance3D.visible = false
			$Area3D/SmallConcrete20/MeshInstance3D.visible = false
			

