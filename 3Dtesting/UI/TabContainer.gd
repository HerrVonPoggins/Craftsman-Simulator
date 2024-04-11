extends TabContainer



#bilder in das RichtTextLabel einfügen
func _ready():
	$"1/RichTextLabel".add_text("bbbbb")
	#$"1/RichTextLabel".add_image(load("res://icon.svg"))
	$"1/RichTextLabel".add_text(" ")
	$"1/RichTextLabel".add_text("ddddddd")
	
	
	
	#häkchen und text der checkboxen ändern wenn benötigt
	$"../checklist".check1state = false
	$"../checklist".check2state = true
	$"../checklist".check3state = false
	$"../checklist".label1text = "test"

