extends Control

var isOpen:bool = false
signal opened
signal closed


#bilder in das RichtTextLabel einfügen
func _ready():
	close()
	#$"TabContainer/1/RichTextLabel".add_text("bbbbb")
	#$"1/RichTextLabel".add_image(load("res://icon.svg"))
	#$"TabContainer/1/RichTextLabel".add_text(" ")
	#$"TabContainer/1/RichTextLabel".add_text("ddddddd")
	
	
	
	#häkchen und text der checkboxen ändern wenn benötigt
	
	#$checklist.check1state = false
	#$checklist.check2state = true
	#$checklist.check3state = false
	#$checklist.label1text = "test"

func _process(delta):
	
	if Global.wall_finished == true:
		$checklist.check3state = true
	if Global.concrete_mixed == true:
		$checklist.check2state = true
	if Global.brick_sawed == true:
		$checklist.check1state = true
	
	
	
	
	if Input.is_action_just_pressed("escape"):
		if isOpen == true:
			close()
			$Button.visible = false
			$Button2.visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		else:
			open()
			$Button.visible = true
			$Button2.visible = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func open():
	$TabContainer.visible = true
	isOpen = true
	opened.emit()


func close():
	$TabContainer.visible = false
	isOpen = false
	closed.emit()


func _on_button_pressed():
	if isOpen == true:
		close()
		$Button.visible = false
		$Button2.visible = false
	else:
		open()


func _on_button_2_pressed():
	if $checklist.visible == false:
		$checklist.visible = true

	else:
		$checklist.visible = false
