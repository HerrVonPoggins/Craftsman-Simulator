extends CanvasLayer


#transition methode: macht das der bildschirm kurz schwarz wird beim aufrufen und dann die szene wechselt
func change_scene(target) -> void:
	$AnimationPlayer.play("appear")
	await($AnimationPlayer.animation_finished)
	get_tree().change_scene_to_file(target)
	
