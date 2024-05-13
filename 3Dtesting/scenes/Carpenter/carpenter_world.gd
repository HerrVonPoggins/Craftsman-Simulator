extends Node3D

var planed_mesh_wallguide = preload("res://assets/carpenter-assets/wallguide_mesh(planed).tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_wallguide_body_entered(body):
	if body.is_in_group("planer"):
		$Props/Wallguide/Wallguide.Mesh = planed_mesh_wallguide
