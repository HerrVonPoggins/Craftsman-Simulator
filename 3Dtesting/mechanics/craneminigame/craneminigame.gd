extends Node3D
var obj = null
var pull = false
@onready var roof1 = $"../Props/Decke1"
@onready var roof2 = $"../Props/Decke2"
@onready var roof3 = $"../Props/Decke3"
@onready var roof4 = $"../Props/Decke4"
@onready var roof5 = $"../Props/Decke5"
@onready var roof7 = $"../Props/Decke7"
@onready var roof8 = $"../Props/Decke8"
@onready var roof9 = $"../Props/Decke9"


@onready var roof_outline_1 = $"Decke1 Area/MeshInstance3D"
@onready var roof_outline_2 = $"Decke2 Area/MeshInstance3D"
@onready var roof_outline_3 = $"Decke3 Area/MeshInstance3D"
@onready var roof_outline_4 = $"Decke4 Area/MeshInstance3D"
@onready var roof_outline_5 = $"Decke5 Area/MeshInstance3D"
@onready var roof_outline_7 = $"Decke7 Area/MeshInstance3D"
@onready var roof_outline_8 = $"Decke8 Area/MeshInstance3D"
@onready var roof_outline_9 = $"Decke9 Area/MeshInstance3D"

@onready var roof_solid_1 = $"Decke1 Area/Decke1"
@onready var roof_solid_2 = $"Decke2 Area/Decke 2"
@onready var roof_solid_3 = $"Decke3 Area/Decke 3"
@onready var roof_solid_4 = $"Decke4 Area/Decke 4"
@onready var roof_solid_5 = $"Decke5 Area/Decke 5"
@onready var roof_solid_7 = $"Decke7 Area/Decke 7"
@onready var roof_solid_8 = $"Decke8 Area/Decke 8"
@onready var roof_solid_9 = $"Decke9 Area/Decke 9"





#scaling for the obj that is pulled by the crane
func _ready():
	$CharacterBody3D/Area3D/Hold.global_scale(Vector3(0.3,0.4,0.4))


#when all the roofs are placed the minigame ends and the filling comes next
func _process(delta):
	if $"Decke1 Area/Decke1".visible == true and $"Decke2 Area/Decke 2".visible == true and $"Decke3 Area/Decke 3".visible == true and $"Decke4 Area/Decke 4".visible == true and $"Decke5 Area/Decke 5".visible == true and $"Decke7 Area/Decke 7".visible == true and $"Decke8 Area/Decke 8".visible == true and $"Decke9 Area/Decke 9".visible == true:
		await get_tree().create_timer(3).timeout
		Global.stay = false
		Global.crosshair_off = false
		Global.roof_finished = true
		queue_free()
		
		

	#sets the object to the hold node
	if obj != null  and $".".visible == true:
		obj.global_transform = $CharacterBody3D/Area3D/Hold.global_transform



		if obj == roof1:
			roof_outline_1.visible = true
		else:
			roof_outline_1.visible = false
		
		if obj == roof2:
			roof_outline_2.visible = true
		else:
			roof_outline_2.visible = false
		if obj == roof3:
			roof_outline_3.visible = true
		else:
			roof_outline_3.visible = false
		if obj == roof4:
			roof_outline_4.visible = true
		else:
			roof_outline_4.visible = false
		if obj == roof5:
			roof_outline_5.visible = true
		else:
			roof_outline_5.visible = false
		if obj == roof7:
			roof_outline_7.visible = true
		else:
			roof_outline_7.visible = false
		if obj == roof8:
			roof_outline_8.visible = true
		else:
			roof_outline_8.visible = false
		if obj == roof9:
			roof_outline_9.visible = true
		else:
			roof_outline_9.visible = false
		
		

#attaches the obj to the hold point with only one object possible
func _on_area_3d_body_entered(body):
	if body.is_in_group("roof") and pull == false:
		obj = body
		pull = true



func _on_decke_1_area_body_entered(body):
	if body.is_in_group("roof1"):
		body.queue_free()
		roof_solid_1.visible = true
		roof_outline_1.visible = false
		pull = false

func _on_decke_2_area_body_entered(body):
	if body.is_in_group("roof2"):
		body.queue_free()
		roof_solid_2.visible = true
		roof_outline_2.visible = false
		pull = false

func _on_decke_3_area_body_entered(body):
	if body.is_in_group("roof3"):
		body.queue_free()
		roof_solid_3.visible = true
		roof_outline_3.visible = false
		pull = false

func _on_decke_4_area_body_entered(body):
	if body.is_in_group("roof4"):
		body.queue_free()
		roof_solid_4.visible = true
		roof_outline_4.visible = false
		pull = false

func _on_decke_5_area_body_entered(body):
	if body.is_in_group("roof5"):
		body.queue_free()
		roof_solid_5.visible = true
		roof_outline_5.visible = false
		pull = false

func _on_decke_7_area_body_entered(body):
	if body.is_in_group("roof7"):
		body.queue_free()
		roof_solid_7.visible = true
		roof_outline_7.visible = false
		pull = false

func _on_decke_8_area_body_entered(body):
	if body.is_in_group("roof8"):
		body.queue_free()
		roof_solid_8.visible = true
		roof_outline_8.visible = false
		pull = false

func _on_decke_9_area_body_entered(body):
	if body.is_in_group("roof9"):
		body.queue_free()
		roof_solid_9.visible = true
		roof_outline_9.visible = false
		pull = false

