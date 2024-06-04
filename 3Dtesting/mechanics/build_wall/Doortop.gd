extends Node3D
var done = false

@onready var lintel_brick = $Lintel/Brick
@onready var lintel_outline = $Lintel/Outline
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Concrete1/MeshInstance3D.visible == true and $Concrete2/MeshInstance3D2.visible == true and done == false:
		Global.concrete = false
		Global.door_top += 1
		done = true



func _on_area_3d_body_entered(body):
	if body.is_in_group("lintel") and Global.wall_finished == true :
		body.queue_free()
		$Lintel/CollisionShape3D.call_deferred("set_disabled", true)
		lintel_brick.visible = true
		lintel_outline.visible = false



func _on_area_3d_2_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true and Global.wall_finished == true:
		if lintel_brick.visible == true:
			$Concrete1/MeshInstance3D.visible = true


func _on_area_3d_3_body_entered(body):
	if body.is_in_group("trowel") and Global.concrete == true and Global.wall_finished == true:
		if lintel_brick.visible == true:
			$Concrete2/MeshInstance3D2.visible = true
