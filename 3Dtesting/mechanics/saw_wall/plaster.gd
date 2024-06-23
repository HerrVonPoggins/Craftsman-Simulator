extends Node3D

var plaster_added = false
var water_added = false
var played = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if plaster_added == true and water_added == true and played == false:
		played = true
		$MeshInstance3D.visible = true
		$Bucket_water.queue_free()



func _on_area_3d_body_entered(body):
	if body.is_in_group("plaster") and $Bucket_water2.visible == true:
		
		plaster_added = true
		body.queue_free()
	if body.is_in_group("water"):
		water_added = true
		body.queue_free()
		$Bucket_water2.visible = true
		$Bucket_water.visible = false
		$AnimationPlayer.play("RESET")
	if $MeshInstance3D.visible == true and body.is_in_group("trowel"):
		Global.plaster_on = true
