extends Node2D

var brick_scene = preload("res://mechanics/brick_cutting/brick.tscn")

func _on_cutting_area_area_entered(area):
	if area.is_in_group("cutting_point"):
		
		var brick_half1 = brick_scene.instantiate()
		brick_half1.position = Vector2(840, 477)
		
		var cut_area1 = brick_half1.get_node("AreaToCut").get_child(0)
		cut_area1.disabled = true
		
		var sprite_1 = brick_half1.get_child(0)
		sprite_1.region_enabled = true
		sprite_1.region_rect = Rect2(-sprite_1.texture.get_width()/2, 0.0, sprite_1.texture.get_width(), sprite_1.texture.get_height())
		add_child(brick_half1)
		
		var brick_half2 = brick_scene.instantiate()
		brick_half2.position = Vector2(870, 477)
		
		var cut_area2 = brick_half2.get_node("AreaToCut").get_child(0)
		cut_area2.disabled = true
		
		var sprite_2 = brick_half2.get_child(0)
		sprite_2.region_enabled = true
		sprite_2.region_rect = Rect2(sprite_2.texture.get_width()/2, 0.0, sprite_2.texture.get_width(), sprite_2.texture.get_height())
		add_child(brick_half2)
		
		$Brick.queue_free()
