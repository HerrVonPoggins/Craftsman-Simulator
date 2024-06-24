extends Node3D

var plaster_added = false
var water_added = false
var played = false
var played2 = false
var played3 = false
@onready var player = $"../Player"
var mixed = false
var spins = 1
var started_timer = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if plaster_added == true and water_added == true and played == false:
		played = true
		$MeshInstance3D.visible = true
		$Bucket_water.queue_free()


	if Input.is_action_just_pressed("kamera"):
		print($Timer.time_left)

	if Global.plaster_mixing == true and played2 == false and $StaticBody3D/Bucket_water2.visible == true and played3 == true:
		$Camera3D.current = true
		Global.stay = true
		Global.crosshair_off = true
		player.visible = false
		$Stick.visible = true



func _unhandled_input(event):
	if event is InputEventMouseMotion and $Camera3D.current == true and Input.is_action_pressed("leftclick") and $Stick.visible == true:
		$AnimationPlayer.play("mix")
		if started_timer == false:
			$Timer.start()
			started_timer = true
		else:
			$Timer.paused = false

		
	if Input.is_action_just_released("leftclick"):
		$AnimationPlayer.pause()
		$Timer.paused = true



func _on_area_3d_body_entered(body):
	if body.is_in_group("plaster") and $StaticBody3D/Bucket_water2.visible == true:
		
		plaster_added = true
		body.queue_free()
	if body.is_in_group("water"):
		water_added = true
		body.queue_free()
		$StaticBody3D/Bucket_water2.visible = true
		$StaticBody3D/CollisionShape3D.call_deferred("set_disabled", false)
		$Bucket_water.visible = false
		$AnimationPlayer.play("RESET")
	if $MeshInstance3D.visible == true and body.is_in_group("trowel") and mixed == true:
		Global.plaster_on = true


func _on_timer_timeout():
	mixed = true
	played3 = true
	Global.plaster_mixing = false
	$Camera3D.current = false
	Global.stay = false
	Global.crosshair_off = false
	player.visible = true
	$Stick.visible = false

