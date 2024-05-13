extends Node2D

var brick_scene = preload("res://mechanics/brick_cutting/brick.tscn")

func _on_cutting_area_area_entered(area):
	if area.is_in_group("cutting_point"):
		var brick_half1 = brick_scene.instantiate()
		var brick_half2 = brick_scene.instantiate()
		brick_half1.position = Vector2(800, 500)
		brick_half2.position = Vector2(800, 350)
		add_child(brick_half1)
		add_child(brick_half2)
		$Brick.queue_free()
