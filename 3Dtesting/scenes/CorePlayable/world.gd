extends Node3D


var counter = 0
var played = false

#plays the animation to fade into the scene from the black screen
func _ready():
	Global.current_scene = 1
	DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_intro.dialogue"))
	$Enter.play("fade_in")

	
	#when the wall is build the animation to fill in the remaining bricks and a praise dialogue is started
func _process(delta):
	if Global.wall_finished == true and played == false:
		$Props/bricks.visible = true
		played = true
		$WallAnimation.play("brick_build")
		await $WallAnimation.animation_finished
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/maurer_intro.dialogue"))


#functions for the info hub to pause the scene
func _on_control_opened():
	get_tree().paused = true


func _on_control_closed():
	get_tree().paused = false

#if the trowel is carried through the bucket the concrete is "on it"
func _on_concrete_bucket_body_entered(body):
	if body.is_in_group("trowel"):
		Global.concrete = true
	if body.is_in_group("tool"):
		Global.concrete = true

#when the cutable brick enters the area3d its scale gets reduced
func _on_saw_body_entered(body):
	if body.is_in_group("cut"):
		$Props/BrickCut.scale = Vector3(1,1,0.5)
		$Props/BrickCut/MeshInstance3D2.scale = Vector3(1,1,0.5)
		$Props/BrickCut/CollisionShape3D.scale = Vector3(1,1,0.5)
		Global.brick_sawed = true


#mechanic for the isolation blocks to appear when they are put into the area3d
func _on_isolation_area_body_entered(body):
	if body.is_in_group("isolation"):
		body.queue_free()
		if $Props/Isolation1.visible == false and counter == 0:
			$Props/Isolation1.visible = true
			counter = 1
		elif $Props/Isolation1.visible == true and counter == 1:
			$Props/Isolation2.visible = true
			counter = 2
		elif $Props/Isolation2.visible == true and counter == 2:
			$Props/Isolation3.visible = true
			Global.isolation = true