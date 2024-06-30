extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.is_in_group("window"):
		body.queue_free()
		Global.is_holding = false
		Global.can_extend = false
		$Window.visible = true
		$WindowMarker.visible = false
	if body.is_in_group("window_board"):
		body.queue_free()
		Global.is_holding = false
		Global.can_extend = false
		$WindowBoard.visible = true
		$WindowBoardMarker.visible = false


