extends Camera3D

var lock_in_wrong = false
var lock_in_correct = false

func _physics_process(delta):
	#Cuttable Brick Movement
	$"../BrickCut".velocity = clamp($"../BrickCut".velocity, Vector3(0,0,-1), Vector3(0,0,1))
	if Input.is_action_just_pressed("left"):
		$"../BrickCut".velocity += Vector3(0,0,1)
	if Input.is_action_just_pressed("right"):
		$"../BrickCut".velocity += Vector3(0,0,-1)
	$"../BrickCut".move_and_slide()

	#Cutting the Brick at the marked position
	if Input.is_action_just_pressed("interagieren"):
		if lock_in_correct == true:
			print("yessir")
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
