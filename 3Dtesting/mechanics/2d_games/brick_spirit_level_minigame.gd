extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Brick.rotation <= 0.05 and $Brick.rotation >= -0.05:
		$Brick.rotation = 0
	if $Brick2.rotation <= 0.05 and $Brick2.rotation >= -0.05:
		$Brick2.rotation = 0
	if $Brick3.rotation <= 0.05 and $Brick3.rotation >= -0.05:
		$Brick3.rotation = 0
	if $Brick.rotation == 0 and $Brick2.rotation == 0 and $Brick3.rotation == 0:
		queue_free()

func _on_area_2d_0_body_entered(body):
	if body.is_in_group("hammer"):
		$Brick.rotate(-0.1)


func _on_area_2d_1_body_entered(body):
	if body.is_in_group("hammer"):
		$Brick.rotate(+0.1)



func _on_area_2d_body_entered(body):
	if body.is_in_group("hammer"):
		$Brick2.rotate(-0.1)
		print($Brick2.rotation)


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("hammer"):
		$Brick2.rotate(+0.1)
		print($Brick2.rotation)



func _on_area_2d_3_body_entered(body):
	if body.is_in_group("hammer"):
		$Brick3.rotate(-0.1)
		print($Brick3.rotation)


func _on_area_2d_4_body_entered(body):
	if body.is_in_group("hammer"):
		$Brick3.rotate(+0.1)
		print($Brick3.rotation)
