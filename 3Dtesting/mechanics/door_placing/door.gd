extends Node3D

var open = false
var is_open = false
var played = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("doorframe_marker")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	open = $Door.open
	if open == true and is_open == false:
		$AnimationPlayer.play("door_open")
		is_open = true
	elif open == false and is_open == true:
		$AnimationPlayer.play_backwards("door_open")
		is_open = false
		open = false
	if $DoorFrame.visible == true and $Door/DoorBoard.visible == true and played == false:
		played = true
		Global.door_done += 1 

func _on_area_body_entered(body):
	if body.is_in_group("door") and $DoorFrame.visible == true:
		body.queue_free()
		Global.is_holding = false
		Global.can_extend = false
		$Door/DoorBoard.visible = true
		$DoorBoardMarker.visible = false
		$Door/CollisionShape3D.call_deferred("set_disabled", false)

	if body.is_in_group("door_frame"):
		body.queue_free()
		Global.is_holding = false
		Global.can_extend = false
		$DoorFrame.visible = true
		$DoorFrameMarker.visible = false
		$DoorBoardMarker.visible = true
		$AnimationPlayer.play("door_marker")
		
