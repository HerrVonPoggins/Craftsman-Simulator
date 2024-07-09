extends Node3D

var saw_line1 = 0
var saw_line2 = 0
var step = 0 
var played = false
var played2 = false
var played3 = false
var played4 = false
var played5 = false
@onready var player = $"../Player"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera3D.current = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if saw_line1 >= 2 and played == false:
		$Saw1.visible = false
		$Camera3D.current = false
		$Saw1/CollisionShape3D.call_deferred("set_disabled", true)
		played = true
		Global.player_visibility = true
		Global.stay = false
		Global.crosshair_off = false
		Global.saw_wall = false
	if saw_line2 >= 2 and played2 == false:
		$Saw2.visible = false
		$Camera3D.current = false
		$Saw2/CollisionShape3D.call_deferred("set_disabled", true)
		played2 = true
		Global.player_visibility = true
		Global.stay = false
		Global.crosshair_off = false
		Global.saw_wall = false

	if saw_line1 >= 2 and saw_line2 >= 2 and played3 == false:
		played3 = true
		Global.wall_sawed = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/elektriker_step_2.dialogue"))
	
	if $Toolinsert1/Cable.visible == true and $Toolinsert2/Cable.visible == true and played4 == false:
		played4 = true
		Global.electric_checkstate += 1
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/elektriker_step_3.dialogue"))
	
	if $PlasterOutlets/OutletCase.visible == true and $PlasterOutlets2/OutletCase.visible == true and played5 == false:
		played5 = true
		Global.electric_checkstate += 1
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/elektriker_step_4.dialogue"))
	
	
	
#moves the saw with mouse
func _unhandled_input(event):

	if event is InputEventMouseMotion and $Camera3D.current == true and Input.is_action_pressed("leftclick"):
		if $Saw1.visible == true:
			$Saw1.position.y += (-event.relative.y * 0.001)
			
		if $Saw2.visible == true:
			$Saw2.position.x += (+event.relative.x * 0.001)
		
		
		
		
		
func _on_toolinsert_1_body_entered(body):
	if body.is_in_group("wall_saw_prop") and saw_line1 <= 0:
		Global.saw_wall = true
		$Saw1.visible = true
		$Camera3D.current = true
		Global.player_visibility = false
		Global.stay = true
		Global.crosshair_off = true
		
	if body.is_in_group("cable") and Global.wall_sawed == true:
		body.queue_free()
		Global.is_holding = false
		Global.can_extend = false
		$Toolinsert1/Cable.visible = true

func _on_toolinsert_2_body_entered(body):
	if body.is_in_group("wall_saw_prop") and saw_line2 <= 0:
		Global.saw_wall = true
		$Saw2.visible = true
		$Camera3D.current = true
		Global.player_visibility = false
		Global.stay = true
		Global.crosshair_off = true
		
	if body.is_in_group("cable") and Global.wall_sawed == true:
		body.queue_free()
		Global.is_holding = false
		Global.can_extend = false
		$Toolinsert2/Cable.visible = true


func _on_plaster_outlets_body_entered(body):
	if body.is_in_group("trowel") and Global.plaster_on == true:
		$PlasterOutlets/PlasterPlaced.visible = true
	if body.is_in_group("outlet") and $PlasterOutlets/PlasterPlaced.visible == true:
		body.queue_free()
		Global.can_power += 1
		$PlasterOutlets/OutletCase.visible = true

func _on_plaster_outlets_2_body_entered(body):
	if body.is_in_group("trowel") and Global.plaster_on == true:
		$PlasterOutlets2/PlasterPlaced.visible = true
	if body.is_in_group("outlet") and $PlasterOutlets/PlasterPlaced.visible == true:
		body.queue_free()
		Global.can_power += 1
		$PlasterOutlets2/OutletCase.visible = true




func _on_area_3d_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D/MeshInstance3D.scale = Vector3(1,1,0.25)
		saw_line1 += 1
		$Node3D/Area3D/CollisionShape3D.call_deferred("set_disabled", true)

func _on_area_3d_2_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D2/MeshInstance3D.scale = Vector3(1,1,0.25)

func _on_area_3d_3_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D3/MeshInstance3D.scale = Vector3(1,1,0.25)

func _on_area_3d_4_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D4/MeshInstance3D.scale = Vector3(1,1,0.25)

func _on_area_3d_5_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D5/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_6_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D6/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_7_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D7/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_8_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D8/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_9_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D9/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_10_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D10/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_11_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D11/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_12_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D12/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_13_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D13/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_14_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D14/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_15_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D15/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_16_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D16/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_17_body_entered(body):
	if body.is_in_group("wall_saw") and $Saw1.visible == true:
		$Node3D/Area3D17/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)
		saw_line1 += 1
		$Node3D/Area3D17/CollisionShape3D.call_deferred("set_disabled", true)




func _on_area_3d_18_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D18/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)
		saw_line2 += 1
		$Line2/Area3D18/CollisionShape3D.call_deferred("set_disabled", true)

func _on_area_3d_19_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D19/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_20_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D20/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_21_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D21/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_22_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D22/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_23_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D23/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_24_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D24/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_25_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D25/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_26_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D26/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_27_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D27/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_28_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D28/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_29_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D29/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_30_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D30/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_31_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D31/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_32_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D32/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_33_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D33/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)

func _on_area_3d_34_body_entered(body):
	if body.is_in_group("wall_saw2") and $Saw2.visible == true:
		$Line2/Area3D34/MeshInstance3D.scale = Vector3(0.25,0.25,0.25)
		saw_line2 += 1
		$Line2/Area3D34/CollisionShape3D.call_deferred("set_disabled", true)







