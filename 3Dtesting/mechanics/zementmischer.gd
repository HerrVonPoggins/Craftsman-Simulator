extends Node3D
var water = false
var concrete = false
@onready var concrete_bucket = $"../ConcreteBucket"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if water == true and concrete == true:
		concrete_bucket.visible = true
		water = false
		concrete = false


func _on_area_3d_body_entered(body):
	if body.is_in_group("water"):
		body.queue_free()
		water = true
	if body.is_in_group("concrete"):
		body.queue_free()
		concrete = true
