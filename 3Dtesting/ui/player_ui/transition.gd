extends CanvasLayer


#transition blackens the screen so the follow up scene can fade in
func _change_scene(target) -> void:
	$AnimationPlayer.play("appear")
	await($AnimationPlayer.animation_finished)
	get_tree().change_scene_to_file(target)
	
