extends Node3D
var move_player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if move_player != null:
		if Input.is_action_pressed("forward"):
			move_player.velocity.y += 0.5
		if Input.is_action_pressed("back"):
			move_player.velocity.y -= 0.5

func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		move_player = body


func _on_area_3d_body_exited(body):
	if body.is_in_group("player"):
		move_player = null
