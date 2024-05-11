extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Enter.play("fade_in")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_control_opened():
	get_tree().paused = true


func _on_control_closed():
	get_tree().paused = false


func _on_stand_still_body_entered(body):
	if body.is_in_group("player"):
		Global.stay = true
