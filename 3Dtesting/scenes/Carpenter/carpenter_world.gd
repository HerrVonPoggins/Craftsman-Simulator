extends Node3D

var planed_mesh_wallguide = preload("res://assets/carpenter-assets/wallguide_mesh(planed).tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Enter.play("fade_in")
	Global.current_scene = 2
	Global.walking_on = $"Map/map/Boden modified/StaticBody3D"
	#$Enter.play("fade_in")
	Global.ground_grass = $"Map/map/Boden modified/StaticBody3D".get_instance_id()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_wallguide_body_entered(body):
	if body.is_in_group("planer"):
		$Props/Wallguide/Wallguide.mesh = planed_mesh_wallguide
