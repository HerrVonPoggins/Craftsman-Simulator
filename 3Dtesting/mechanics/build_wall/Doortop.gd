extends Node3D
var done = false

@onready var lintel_brick = $Lintel/Brick
@onready var lintel_outline = $Lintel/Outline


func _on_lintel_body_entered(body):
	if body.is_in_group("lintel") and Global.wall_finished == true :
		body.queue_free()
		Global.is_holding = false
		Global.can_extend = false
		Music._play_brick_placing()
		$Lintel/CollisionShape3D.call_deferred("set_disabled", true)
		lintel_brick.visible = true
		lintel_outline.visible = false
		Global.door_top += 1
