extends Node3D

var open = false
var is_open = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
	if Input.is_action_just_pressed("kamera"):
		print(open)

func _on_area_body_entered(body):
	if body.is_in_group("door") and $DoorFrame.visible == true:
		$Door/DoorBoard.visible = true
		$DoorBoardMarker.visible = false
		$Door/CollisionShape3D.call_deferred("set_disabled", false)

	if body.is_in_group("door_frame"):
		$DoorFrame.visible = true
		$DoorFrameMarker.visible = false
