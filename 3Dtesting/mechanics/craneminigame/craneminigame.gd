extends Node3D
var obj = null
@onready var roof1 = $"../Props/Decke1"
@onready var roof2 = $"../Props/Decke2"
@onready var roof3 = $"../Props/Decke3"
@onready var roof4 = $"../Props/Decke4"
@onready var roof5 = $"../Props/Decke5"
@onready var roof7 = $"../Props/Decke7"
@onready var roof8 = $"../Props/Decke8"
@onready var roof9 = $"../Props/Decke9"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"Decke1 Area/Decke1".visible == true and $"Decke2 Area/Decke 2".visible == true and $"Decke3 Area/Decke 3".visible == true and $"Decke4 Area/Decke 4".visible == true and $"Decke5 Area/Decke 5".visible == true and $"Decke7 Area/Decke 7".visible == true and $"Decke8 Area/Decke 8".visible == true and $"Decke9 Area/Decke 9".visible == true:
		await get_tree().create_timer(3).timeout
		Global.stay = false
		Global.crosshair_off = false
		Global.roof_finished = true
		queue_free()
	
	
	if obj != null  and $".".visible == true:
		obj.global_transform = $CharacterBody3D/Area3D/Hold.global_transform

		if obj == roof1:
			$"Decke1 Area/MeshInstance3D".visible = true
		if obj == roof2:
			$"Decke2 Area/MeshInstance3D".visible = true
		if obj == roof3:
			$"Decke3 Area/MeshInstance3D".visible = true
		if obj == roof4:
			$"Decke4 Area/MeshInstance3D".visible = true
		if obj == roof5:
			$"Decke5 Area/MeshInstance3D".visible = true
		if obj == roof7:
			$"Decke7 Area/MeshInstance3D".visible = true
		if obj == roof8:
			$"Decke8 Area/MeshInstance3D".visible = true
		if obj == roof9:
			$"Decke9 Area/MeshInstance3D".visible = true
		
		


func _on_area_3d_body_entered(body):
	if body.is_in_group("roof"):
		obj = body
		obj.scale = Vector3(100,100,100)


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
		#await get_tree().create_timer(3).timeout
		#Global.stay = false
		#Global.roof_finished = true
		#queue_free()
		
