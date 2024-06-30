extends Camera3D

signal brick_cut_correct

var lock_in_wrong = false
var lock_in_correct = false

func _physics_process(delta):
	#Cuttable Brick Movement
	if Global.brick_saw_cam == true:
		Global.stay = true
		Global.crosshair_off = true
		Global.player_visibility = false
		$"../BrickCut".velocity = clamp($"../BrickCut".velocity, Vector3(0,0,-0.5), Vector3(0,0,0.5))
		if Input.is_action_pressed("left"):
			$"../BrickCut".velocity = Vector3(0,0,0.5)
		elif Input.is_action_pressed("right"):
			$"../BrickCut".velocity = Vector3(0,0,-0.5)
		else:
			$"../BrickCut".velocity = Vector3(0,0,0)
		$"../BrickCut".move_and_slide()

	#Cutting the Brick at the marked position
	if Input.is_action_just_pressed("interagieren"):
		if lock_in_correct == true:
			emit_signal("brick_cut_correct")
			Global.stay = false
			Global.crosshair_off = false
			Global.player_visibility = true
			Global.dialogue_open = false
		elif lock_in_wrong == true:
			print("wrong")

func _on_cut_area_area_entered(area):
	if area.is_in_group("lock_in"):
		lock_in_wrong = true
	if area.is_in_group("lock_in_correct"):
		lock_in_correct = true


func _on_cut_area_area_exited(area):
	if area.is_in_group("lock_in") or area.is_in_group("lock_in_correct"):
		lock_in_wrong = false
		lock_in_correct = false
