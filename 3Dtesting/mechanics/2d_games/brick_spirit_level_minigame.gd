extends Node2D

@onready var Brick_1 = $Brick
@onready var Brick_2 = $Brick2
@onready var Brick_3 = $Brick3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Brick_1.rotation <= 0.05 and Brick_1.rotation >= -0.05:
		Brick_1.rotation = 0
	if Brick_2.rotation <= 0.05 and Brick_2.rotation >= -0.05:
		Brick_2.rotation = 0
	if  Brick_3.rotation <= 0.05 and  Brick_3.rotation >= -0.05:
		Brick_3.rotation = 0
	if Brick_1.rotation == 0 and Brick_2.rotation == 0 and Brick_3.rotation == 0:
		queue_free()

func _on_area_2d_0_body_entered(body):
	if body.is_in_group("hammer"):
		Brick_1.rotate(-0.1)


func _on_area_2d_1_body_entered(body):
	if body.is_in_group("hammer"):
		Brick_1.rotate(+0.1)



func _on_area_2d_body_entered(body):
	if body.is_in_group("hammer"):
		Brick_2.rotate(-0.1)



func _on_area_2d_2_body_entered(body):
	if body.is_in_group("hammer"):
		Brick_2.rotate(+0.1)




func _on_area_2d_3_body_entered(body):
	if body.is_in_group("hammer"):
		Brick_3.rotate(-0.1)



func _on_area_2d_4_body_entered(body):
	if body.is_in_group("hammer"):
		Brick_3.rotate(+0.1)

