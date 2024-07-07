extends Node3D

var window_done = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("marker")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $WindowBoard.visible == true and $Window.visible == true:
		window_done = true


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
		$WindowBoard/RootNode/WindowFrame.visible = true
		$WindowFrameMarker.visible = false


