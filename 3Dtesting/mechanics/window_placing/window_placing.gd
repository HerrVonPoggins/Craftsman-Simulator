extends Node3D
var played = false
var window_done = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("marker")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if$WindowBoard/RootNode/WindowFrame.visible == true and $Window.visible == true and played == false and $Foam.get_node("Foam/Foamshape").visible == true and $Foam16.get_node("Foam/Foamshape").visible == true:
		played = true
		window_done = true
		Global.carpenter_checkstate += 1


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


