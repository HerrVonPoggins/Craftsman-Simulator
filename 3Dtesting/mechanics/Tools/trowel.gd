extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.concrete == true:
		$"mörtelkelle".mesh = load("res://assets/models/RiffelKelle_mit_Mörtel.fbx::ArrayMesh_4r105")
	else:
		$"mörtelkelle".mesh = load("res://mechanics/Tools/trowel.tscn::ArrayMesh_dkvsd")
