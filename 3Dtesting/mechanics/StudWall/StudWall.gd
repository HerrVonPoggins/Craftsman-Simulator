extends Node3D

var counter = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.is_in_group("profile_long"):
		body.queue_free()
		if $Profile.visible == false:
			$Profile.visible = true
			$Outlines/OutlineProfile8.visible = false
			$Outlines/OutlineProfile9.visible = true
		else:
			$Profile2.visible = true
			$Outlines/OutlineProfile9.visible = false
			$Outlines/OutlineProfile.visible = true

	if body.is_in_group("profile_short") and $Profile2.visible == true:
		if $Profile3.visible == false and counter == 0:
			body.queue_free()
			$Profile3.visible = true
			$Outlines/OutlineProfile.visible = false
			$Outlines/OutlineProfile7.visible = true
			counter = 1
		elif $Profile3.visible == true and counter == 1:
			body.queue_free()
			$Profile9.visible = true
			$Outlines/OutlineProfile7.visible = false
			$Outlines/OutlineProfile2.visible = true
			counter = 2
		elif $Profile9.visible == true and counter == 2:
			body.queue_free()
			$Profile4.visible = true
			$Outlines/OutlineProfile2.visible = false
			$Outlines/OutlineProfile3.visible = true
			counter = 3
		elif $Profile4.visible == true and counter == 3:
			body.queue_free()
			$Profile5.visible = true
			$Outlines/OutlineProfile3.visible = false
			$Outlines/OutlineProfile4.visible = true
			counter = 4
		elif $Profile5.visible == true and counter == 4:
			body.queue_free()
			$Profile6.visible = true
			$Outlines/OutlineProfile4.visible = false
			$Outlines/OutlineProfile5.visible = true
			counter = 5
		elif $Profile6.visible == true and counter == 5:
			body.queue_free()
			$Profile7.visible = true
			$Outlines/OutlineProfile5.visible = false
			$Outlines/OutlineProfile6.visible = true
			counter = 6
		elif $Profile7.visible == true and counter == 6:
			body.queue_free()
			$Profile8.visible = true
			$Outlines/OutlineProfile6.visible = false
			$Outlines/OutlineGKBLarge6.visible = true
			counter = 7

	if body.is_in_group("gkb_long") and $Profile8.visible == true:
		if $GKB1.visible == false and counter == 7:
			body.queue_free()
			$GKB1.visible = true
			$Outlines/OutlineGKBLarge6.visible = false
			$Outlines/OutlineGKBSmall6.visible = true
			counter = 8
		elif $GKB8.visible == true and counter == 9:
			body.queue_free()
			$GKB4.visible = true
			$Outlines/OutlineGKBLarge10.visible = false
			$Outlines/OutlineGKBSmall10.visible = true
			counter = 10
		elif $GKB9.visible == true and counter == 11:
			body.queue_free()
			$GKB2.visible = true
			$Outlines/OutlineGKBLarge7.visible = false
			$Outlines/OutlineGKBSmall7.visible = true
			counter = 12
		elif $GKB11.visible == true and counter == 13:
			body.queue_free()
			$GKB5.visible = true
			$Outlines/OutlineGKBLarge9.visible = false
			$Outlines/OutlineGKBSmall9.visible = true
			counter = 14
		elif $GKB10.visible == true and counter == 15:
			body.queue_free()
			$GKB3.visible = true
			$Outlines/OutlineGKBLarge8.visible = false
			$Outlines/OutlineGKBSmall8.visible = true
			counter = 16




		elif $Isolation6.visible == true and counter == 25:
			body.queue_free()
			$GKB13.visible = true
			$Outlines/OutlineGKBLarge.visible = false
			$Outlines/OutlineGKBSmall.visible = true
			counter = 26
		elif $GKB21.visible == true and counter == 27:
			body.queue_free()
			$GKB17.visible = true
			$Outlines/OutlineGKBLarge5.visible = false
			$Outlines/OutlineGKBSmall5.visible = true
			counter = 28
		elif $GKB22.visible == true and counter == 29:
			body.queue_free()
			$GKB14.visible = true
			$Outlines/OutlineGKBLarge2.visible = false
			$Outlines/OutlineGKBSmall2.visible = true
			counter = 30
		elif $GKB24.visible == true and counter == 31:
			body.queue_free()
			$GKB18.visible = true
			$Outlines/OutlineGKBLarge4.visible = false
			$Outlines/OutlineGKBSmall4.visible = true
			counter = 32
		elif $GKB23.visible == true and counter == 33:
			body.queue_free()
			$GKB15.visible = true
			$Outlines/OutlineGKBLarge3.visible = false
			$Outlines/OutlineGKBSmall3.visible = true
			counter = 34



	if body.is_in_group("gkb_short") and $Profile8.visible == true:
		if $GKB8.visible == false and counter == 8:
			body.queue_free()
			$GKB8.visible = true
			$Outlines/OutlineGKBSmall6.visible = false
			$Outlines/OutlineGKBLarge10.visible = true
			counter = 9
		elif $GKB4.visible == true and counter == 10:
			body.queue_free()
			$GKB9.visible = true
			$Outlines/OutlineGKBSmall10.visible = false
			$Outlines/OutlineGKBLarge7.visible = true
			counter = 11
		elif $GKB2.visible == true and counter == 12:
			body.queue_free()
			$GKB11.visible = true
			$Outlines/OutlineGKBSmall7.visible = false
			$Outlines/OutlineGKBLarge9.visible = true
			counter = 13
		elif $GKB5.visible == true and counter == 14:
			body.queue_free()
			$GKB10.visible = true
			$Outlines/OutlineGKBSmall9.visible = false
			$Outlines/OutlineGKBLarge8.visible = true
			counter = 15
		elif $GKB3.visible == true and counter == 16:
			body.queue_free()
			$GKB12.visible = true
			$Outlines/OutlineGKBSmall8.visible = false
			$Outlines/OutlineGKBThinLarge2.visible = true
			counter = 17



		elif $GKB13.visible == true and counter == 26:
			body.queue_free()
			$GKB21.visible = true
			$Outlines/OutlineGKBSmall.visible = false
			$Outlines/OutlineGKBLarge5.visible = true
			counter = 27
		elif $GKB17.visible == true and counter == 28:
			body.queue_free()
			$GKB22.visible = true
			$Outlines/OutlineGKBSmall5.visible = false
			$Outlines/OutlineGKBLarge2.visible = true
			counter = 29
		elif $GKB14.visible == true and counter == 30:
			body.queue_free()
			$GKB24.visible = true
			$Outlines/OutlineGKBSmall2.visible = false
			$Outlines/OutlineGKBLarge4.visible = true
			counter = 31
		elif $GKB18.visible == true and counter == 32:
			body.queue_free()
			$GKB23.visible = true
			$Outlines/OutlineGKBSmall4.visible = false
			$Outlines/OutlineGKBLarge3.visible = true
			counter = 33
		elif $GKB15.visible == true and counter == 34:
			body.queue_free()
			$GKB25.visible = true
			$Outlines/OutlineGKBSmall3.visible = false
			$Outlines/OutlineGKBThinLarge.visible = true
			counter = 35



	if body.is_in_group("gkb_thin_long"):

		if $GKB6.visible == false and counter == 17:
			body.queue_free()
			$GKB6.visible = true
			$Outlines/OutlineGKBThinLarge2.visible = false
			$Outlines/OutlineGKBThinSmall2.visible = true
			counter = 18
		elif $GKB25.visible == true and counter == 35:
			body.queue_free()
			$GKB19.visible = true
			$Outlines/OutlineGKBThinLarge.visible = false
			$Outlines/OutlineGKBThinSmall.visible = true
			counter = 36


	if body.is_in_group("gkb_thin_short"):
		if $GKB6.visible == true and counter == 18:
			body.queue_free()
			$GKB7.visible = true
			$Outlines/OutlineGKBThinSmall2.visible = false
			$Outlines/OutlineIsolation.visible = true
			counter = 19
		elif $GKB19.visible == true and counter == 36:
			body.queue_free()
			$GKB20.visible = true
			$Outlines/OutlineGKBThinSmall.visible = false
			#evtl marker für spachterl einfügen 
			counter = 36.5
			$Area3D2.visible = true
			$Area3D3.visible = true
			$Area3D4.visible = true
			$Area3D5.visible = true
			$Area3D6.visible = true








	if body.is_in_group("isolation"):
		if $Isolation1.visible == false and counter == 19:
			body.queue_free()
			$Isolation1.visible = true
			$Outlines/OutlineIsolation.visible = false
			$Outlines/OutlineIsolation2.visible = true
			counter = 20
		elif $Isolation1.visible == true and counter == 20:
			body.queue_free()
			$Isolation2.visible = true
			$Outlines/OutlineIsolation2.visible = false
			$Outlines/OutlineIsolation3.visible = true
			counter = 21
		elif $Isolation2.visible == true and counter == 21:
			body.queue_free()
			$Isolation3.visible = true
			$Outlines/OutlineIsolation3.visible = false
			$Outlines/OutlineIsolation4.visible = true
			counter = 22
		elif $Isolation3.visible == true and counter == 22:
			body.queue_free()
			$Isolation4.visible = true
			$Outlines/OutlineIsolation4.visible = false
			$Outlines/OutlineIsolation5.visible = true
			counter = 23
		elif $Isolation4.visible == true and counter == 23:
			body.queue_free()
			$Isolation5.visible = true
			$Outlines/OutlineIsolation5.visible = false
			$Outlines/OutlineIsolation6.visible = true
			counter = 24
		elif $Isolation5.visible == true and counter == 24:
			body.queue_free()
			$Isolation6.visible = true
			$Outlines/OutlineIsolation6.visible = false
			$Outlines/OutlineGKBLarge.visible = true
			counter = 25


func _on_spachtel_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel.visible = true
func _on_spachtel_2_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel2.visible = true
func _on_spachtel_3_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel3.visible = true
func _on_spachtel_4_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel4.visible = true
func _on_spachtel_5_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel5.visible = true
func _on_spachtel_6_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel6.visible = true
func _on_spachtel_7_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel7.visible = true
func _on_spachtel_8_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel8.visible = true
func _on_spachtel_9_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel9.visible = true
func _on_spachtel_10_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel10.visible = true
func _on_spachtel_11_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel11.visible = true
func _on_spachtel_12_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel12.visible = true
func _on_spachtel_13_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel13.visible = true
func _on_spachtel_14_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel14.visible = true
func _on_spachtel_15_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel15.visible = true
func _on_spachtel_16_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel16.visible = true
func _on_spachtel_17_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel17.visible = true
func _on_spachtel_18_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel18.visible = true
func _on_spachtel_19_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel19.visible = true
func _on_spachtel_20_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel20.visible = true
func _on_spachtel_21_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel21.visible = true
func _on_spachtel_22_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel22.visible = true
func _on_spachtel_23_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel23.visible = true
func _on_spachtel_24_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel24.visible = true
func _on_spachtel_25_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel25.visible = true
func _on_spachtel_26_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel26.visible = true
func _on_spachtel_27_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel27.visible = true
func _on_spachtel_28_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel28.visible = true
func _on_spachtel_29_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel29.visible = true
func _on_spachtel_30_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel30.visible = true
func _on_spachtel_31_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel31.visible = true
func _on_spachtel_32_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel32.visible = true
func _on_spachtel_33_body_entered(body):
	if body.is_in_group("trowel") and counter == 37 and Input.is_action_pressed("leftclick"):
		$Spachtel/Spachtel33.visible = true


func _on_area_3d_2_body_entered(body):
	if body.is_in_group("drill") and counter == 36.5:
		$Area3D2/CollisionShape3D.call_deferred("set_disabled", true)
		$Area3D2/screw.position.y -= 0.1
		$Area3D2/screwhead.position.y -= 0.1
		await get_tree().create_timer(1).timeout
		$Area3D2/screw.position.y -= 0.1
		$Area3D2/screwhead.position.y -= 0.1
		await get_tree().create_timer(1).timeout
		$Area3D2/screw.position.y -= 0.1
		$Area3D2/screwhead.position.y -= 0.1





func _on_area_3d_3_body_entered(body):
	if body.is_in_group("drill") and counter == 36.5:
		$Area3D3/CollisionShape3D.call_deferred("set_disabled", true)
		$Area3D3/screw.position.y -= 0.1
		$Area3D3/screwhead.position.y -= 0.1
		await get_tree().create_timer(1).timeout
		$Area3D3/screw.position.y -= 0.1
		$Area3D3/screwhead.position.y -= 0.1
		await get_tree().create_timer(1).timeout
		$Area3D3/screw.position.y -= 0.1
		$Area3D3/screwhead.position.y -= 0.1


func _on_area_3d_4_body_entered(body):
	if body.is_in_group("drill") and counter == 36.5:
		$Area3D4/CollisionShape3D.call_deferred("set_disabled", true)
		$Area3D4/screw.position.y -= 0.1
		$Area3D4/screwhead.position.y -= 0.1
		await get_tree().create_timer(1).timeout
		$Area3D4/screw.position.y -= 0.1
		$Area3D4/screwhead.position.y -= 0.1
		await get_tree().create_timer(1).timeout
		$Area3D4/screw.position.y -= 0.1
		$Area3D4/screwhead.position.y -= 0.1


func _on_area_3d_5_body_entered(body):
	if body.is_in_group("drill") and counter == 36.5:
		$Area3D5/CollisionShape3D.call_deferred("set_disabled", true)
		$Area3D5/screw.position.y -= 0.1
		$Area3D5/screwhead.position.y -= 0.1
		await get_tree().create_timer(1).timeout
		$Area3D5/screw.position.y -= 0.1
		$Area3D5/screwhead.position.y -= 0.1
		await get_tree().create_timer(1).timeout
		$Area3D5/screw.position.y -= 0.1
		$Area3D5/screwhead.position.y -= 0.1



func _on_area_3d_6_body_entered(body):
	if body.is_in_group("drill") and counter == 36.5:
		$Area3D6/CollisionShape3D.call_deferred("set_disabled", true)
		$Area3D6/screw.position.y -= 0.1
		$Area3D6/screwhead.position.y -= 0.1
		await get_tree().create_timer(1).timeout
		$Area3D6/screw.position.y -= 0.1
		$Area3D6/screwhead.position.y -= 0.1
		await get_tree().create_timer(1).timeout
		$Area3D6/screw.position.y -= 0.1
		$Area3D6/screwhead.position.y -= 0.1
		counter = 37
