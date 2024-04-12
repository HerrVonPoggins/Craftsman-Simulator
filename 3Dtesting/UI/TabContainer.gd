extends Control

var isOpen:bool = false
signal opened
signal closed


#bilder in das RichtTextLabel einfügen
func _ready():
	close()
	$"TabContainer/1/RichTextLabel".add_text("bbbbb")
	#$"1/RichTextLabel".add_image(load("res://icon.svg"))
	$"TabContainer/1/RichTextLabel".add_text(" ")
	$"TabContainer/1/RichTextLabel".add_text("ddddddd")
	
	
	
	#häkchen und text der checkboxen ändern wenn benötigt
	$checklist.check1state = false
	$checklist.check2state = true
	$checklist.check3state = false
	$checklist.label1text = "test"

func _process(delta):
	if Input.is_action_just_pressed("rightclick"):
		$checklist.check1state = true
		$checklist.label1text = "es geht !!!"
		

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
	else:
		open()
