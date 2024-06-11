extends Node3D
var done = false

@onready var lintel_brick = $Lintel/Brick
@onready var lintel_outline = $Lintel/Outline
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass






func _on_lintel_body_entered(body):
	if body.is_in_group("lintel") and Global.wall_finished == true :
		body.queue_free()
		Music._play_brick_placing()
		$Lintel/CollisionShape3D.call_deferred("set_disabled", true)
		lintel_brick.visible = true
		lintel_outline.visible = false
		Global.door_top += 1
