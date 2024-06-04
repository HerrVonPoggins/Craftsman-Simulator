extends Node3D

signal sand_level_reached

var water = false
var concrete = false
var water_filled = false
var cement_filled = false
var sand = false
var sand_filled = false
var sand_level_1 = false
var sand_level_2 = false
var sand_level_3 = false

@onready var concrete_bucket_obj = $"../Props/ConcreteBucketObj"
@onready var collision_shape_3d = $"../Props/ConcreteBucketObj/CollisionShape3D"
@onready var sand_value = $SandValue
@onready var water_value = $WaterValue
@onready var cement_value = $CementValue

func _ready():
	cement_value.visible = false
	water_value.visible = false
	sand_value.visible = false

func _process(delta):
	if water == true: #and Global.tutorial_finished == true:
		if Input.is_action_pressed("leftclick"):
			water_value.value += 100 * delta
	if water_value.value >= 100:
		water_value.value = 100
		water_filled = true
	if concrete == true: #and Global.tutorial_finished == true:
		if Input.is_action_pressed("leftclick"):
			cement_value.value += 100 * delta
	if cement_value.value >= 100:
		cement_value.value = 100
		cement_filled = true
	if sand == true: #and Global.tutorial_finished == true:
		if Input.is_action_pressed("leftclick"):
			sand_value.value += 25 * delta
	if sand_value.value >= 25:
		if sand_level_1 == false:
			emit_signal("sand_level_reached")
			sand_level_1 = true
	if sand_value.value >= 50:
		if sand_level_2 == false:
			emit_signal("sand_level_reached")
			sand_level_2 = true
	if sand_value.value >= 75:
		if sand_level_3 == false:
			emit_signal("sand_level_reached")
			sand_level_3 = true
	if sand_value.value >= 100:
		sand_value.value = 100
		sand_filled = true
	#mechanic to fill water and concretebag into the mixer
func _on_range_body_entered(body):
	if body.is_in_group("water"):
		water_value.visible = true
		cement_value.visible = true
		sand_value.visible = true
		water = true
	if body.is_in_group("concrete"):
		water_value.visible = true
		cement_value.visible = true
		sand_value.visible = true
		concrete = true
	if body.is_in_group("sand"):
		water_value.visible = true
		sand_value.visible = true
		cement_value.visible = true
		sand = true

func _on_player_start_mixer():
	if water_filled == true and cement_filled == true and sand_filled == true:
		#if mixer is turned on the concrete bucket becomes visible 
		concrete_bucket_obj.visible = true
		concrete_bucket_obj.freeze = false
		collision_shape_3d.disabled = false
		water = false
		concrete = false
		Global.concrete_mixed = true


func _on_range_body_exited(body):
	if body.is_in_group("water"):
		water_value.visible = false
		cement_value.visible = false
		sand_value.visible = false
		water = false
	if body.is_in_group("concrete"):
		water_value.visible = false
		cement_value.visible = false
		sand_value.visible = false
		concrete = false
	if body.is_in_group("sand"):
		water_value.visible = false
		cement_value.visible = false
		sand_value.visible = false
		sand = false
