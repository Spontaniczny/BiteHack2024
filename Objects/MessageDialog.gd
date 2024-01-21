extends PopupPanel

const timeout := 3.5

@onready var label := get_node("ColorRect/Container/Text")

func display(text: String):
	label.text = text
	
	show()
	
	await get_tree()\
		.create_timer(timeout)\
		.timeout
	
	hide()
