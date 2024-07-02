extends Node3D

signal sand_level_reached

var minigame_started = false

var water = false
var concrete = false
var water_filled = false
var cement_filled = false
var sand = false
var sand_filled = false
var sand_level_1 = false
var sand_level_2 = false
var sand_level_3 = false


@onready var concrete_bucket_obj = $"../Props/ConcreteBucket"
@onready var collision_shape_3d = $"../Props/ConcreteBucket/CollisionShape3D"
@onready var sand_value = $SandValue
@onready var water_value = $WaterValue
@onready var cement_value = $CementValue
@onready var moertel_progress_bar = $MoertelProgressBar

func _ready():
	moertel_progress_bar.visible = false
	cement_value.visible = false
	water_value.visible = false
	sand_value.visible = false

func _process(delta):
	if minigame_started == true:
		moertel_progress_bar.visible = true
		cement_value.visible = true
		water_value.visible = true
		sand_value.visible = true
	if water == true: #and Global.tutorial_finished == true:
		if Input.is_action_pressed("interagieren") and Global.tutorial_finished == true:
			water_value.value += 100 * delta
	if water_value.value >= 100:
		water_value.value = 100
		if water_filled == false:
			emit_signal("sand_level_reached")
			water_filled = true
	if concrete == true: #and Global.tutorial_finished == true:
		if Input.is_action_pressed("interagieren")and Global.tutorial_finished == true:
			cement_value.value += 100 * delta
	if cement_value.value >= 100:
		cement_value.value = 100
		if cement_filled == false:
			emit_signal("sand_level_reached")
			cement_filled = true
	if sand == true: #and Global.tutorial_finished == true:
		if Input.is_action_pressed("interagieren")and Global.tutorial_finished == true:
			sand_value.value += 100 * delta
	if sand_value.value >= 100:
		if sand_level_1 == false:
			emit_signal("sand_level_reached")
			sand_level_1 = true
	if sand_value.value >= 200:
		if sand_level_2 == false:
			emit_signal("sand_level_reached")
			sand_level_2 = true
	if sand_value.value >= 300:
		if sand_level_3 == false:
			emit_signal("sand_level_reached")
			sand_level_3 = true
	if sand_value.value >= 400:
		sand_value.value = 400
		if sand_filled == false:
			emit_signal("sand_level_reached")
			sand_filled = true
	#mechanic to fill water and concretebag into the mixer
func _on_range_body_entered(body):
	if body.is_in_group("water"):
		water = true
		if minigame_started == false and Global.tutorial_finished == true:
			minigame_started = true
	if body.is_in_group("concrete"):
		concrete = true
		if minigame_started == false and Global.tutorial_finished == true:
			minigame_started = true
	if body.is_in_group("sand"):
		sand = true
		if minigame_started == false and Global.tutorial_finished == true:
			minigame_started = true

var mixer_started = false
func _on_player_start_mixer():
	if water_filled == true and cement_filled == true and sand_filled == true:
		if mixer_started == false:
		#if mixer is turned on the concrete bucket becomes visible 
			concrete_bucket_obj.visible = true
			concrete_bucket_obj.freeze = false
			collision_shape_3d.disabled = false
			water = false
			concrete = false
			sand = false
			mixer_started = true

			Global.concrete_mixed = true
			Global.dialogue_count = 3
			Global.dialogue_replay = null
	#after the mixer starts the progress bars become invisible
			minigame_started = false
			$MoertelProgressBar.visible = false
			cement_value.visible = false
			water_value.visible = false
			sand_value.visible = false
		
	else:
		Global.dialogue_replay = 1
		


func _on_range_body_exited(body):
	if body.is_in_group("water"):
		water = false
	if body.is_in_group("concrete"):
		concrete = false
	if body.is_in_group("sand"):
		sand = false
