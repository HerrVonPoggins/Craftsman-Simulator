extends TabContainer


#bilder in das RichtTextLabel einfügen
func _ready():
	$"1/RichTextLabel".add_text("bbbbb")
	#$"1/RichTextLabel".add_image(load("res://icon.svg"))
	$"1/RichTextLabel".add_text(" ")
	$"1/RichTextLabel".add_text("ddddddd")
	pass
	#$"2/RichTextLabel2".add_image(load("res://icon.svg"))
	#$"2/RichTextLabel2".add_image(load("res://icon.svg"))
