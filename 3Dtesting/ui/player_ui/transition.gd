extends CanvasLayer


#transition blackens the screen so the follow up scene can fade in
func _change_scene(target) -> void:
	$AnimationPlayer.play("appear")
	await($AnimationPlayer.animation_finished)
	get_tree().change_scene_to_file(target)
	
func _change_scene_day_1(target) -> void:
	$AnimationPlayer.play("appear_day_1")
	await($AnimationPlayer.animation_finished)
	get_tree().change_scene_to_file(target)

func _change_scene_day_2(target) -> void:
	$AnimationPlayer.play("appear_day_2")
	await($AnimationPlayer.animation_finished)
	get_tree().change_scene_to_file(target)
