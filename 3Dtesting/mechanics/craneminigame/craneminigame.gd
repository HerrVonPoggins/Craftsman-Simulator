extends Node3D
var obj = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("kamera"):
		
		#$"Root Scene2/AnimationPlayer2".play("Kran teil1|Kran teil1_Go")
		#await $"Root Scene2/AnimationPlayer".animation_finished
		#$"Root Scene2/AnimationPlayer".play("Kran teil1_001|Kran teil1_Los")
		
		#await $"Root Scene/AnimationPlayer".animation_finished
	
	
	
	if obj != null  and $".".visible == true:
		obj.global_transform = $CharacterBody3D/Area3D/Hold.global_transform

		if obj == $Decke1:
			$"Decke1 Area/MeshInstance3D".visible = true
		if obj == $Decke2:
			$"Decke2 Area/MeshInstance3D".visible = true
		if obj == $Decke3:
			$"Decke3 Area/MeshInstance3D".visible = true
		if obj == $Decke4:
			$"Decke4 Area/MeshInstance3D".visible = true
		if obj == $Decke5:
			$"Decke5 Area/MeshInstance3D".visible = true
		if obj == $Decke6:
			$"Decke6 Area/MeshInstance3D".visible = true
		if obj == $Decke7:
			$"Decke7 Area/MeshInstance3D".visible = true
		if obj == $Decke8:
			$"Decke8 Area/MeshInstance3D".visible = true
		if obj == $Decke9:
			$"Decke9 Area/MeshInstance3D".visible = true
		
		


func _on_area_3d_body_entered(body):
	if body.is_in_group("roof"):
		obj = body


func _on_decke_1_area_body_entered(body):
	if body.is_in_group("roof1"):
		body.queue_free()
		$"Decke1 Area/Decke1".visible = true
		$"Decke1 Area/MeshInstance3D".queue_free()


func _on_decke_2_area_body_entered(body):
	if body.is_in_group("roof2"):
		body.queue_free()
		$"Decke2 Area/Decke 2".visible = true
		$"Decke2 Area/MeshInstance3D".queue_free()


func _on_decke_3_area_body_entered(body):
	if body.is_in_group("roof3"):
		body.queue_free()
		$"Decke3 Area/Decke 3".visible = true
		$"Decke3 Area/MeshInstance3D".queue_free()


func _on_decke_4_area_body_entered(body):
	if body.is_in_group("roof4"):
		body.queue_free()
		$"Decke4 Area/Decke 4".visible = true
		$"Decke4 Area/MeshInstance3D".queue_free()

func _on_decke_5_area_body_entered(body):
	if body.is_in_group("roof5"):
		body.queue_free()
		$"Decke5 Area/Decke 5".visible = true
		$"Decke5 Area/MeshInstance3D".queue_free()

func _on_decke_6_area_body_entered(body):
	if body.is_in_group("roof6"):
		body.queue_free()
		$"Decke6 Area/Decke 6".visible = true
		$"Decke6 Area/MeshInstance3D".queue_free()

func _on_decke_7_area_body_entered(body):
	if body.is_in_group("roof7"):
		body.queue_free()
		$"Decke7 Area/Decke 7".visible = true
		$"Decke7 Area/MeshInstance3D".queue_free()

func _on_decke_8_area_body_entered(body):
	if body.is_in_group("roof8"):
		body.queue_free()
		$"Decke8 Area/Decke 8".visible = true
		$"Decke8 Area/MeshInstance3D".queue_free()

func _on_decke_9_area_body_entered(body):
	if body.is_in_group("roof9"):
		body.queue_free()
		$"Decke9 Area/Decke 9".visible = true
		$"Decke9 Area/MeshInstance3D".queue_free()
		await get_tree().create_timer(3).timeout
		Global.stay = false
		Global.roof_finished = true
		queue_free()
		
