extends PopupPanel

@onready var label := get_node("Label")

var seconds: int = 0

func update():
	seconds += 1
	var formatted_time = format_time()
	label.text = "Time Played: " + formatted_time

func format_time() -> String:
	var hours = int(seconds / 3600)
	var minutes = int((seconds % 3600) / 60)
	var seconds_remainder = int(seconds % 60)

	return str(hours).pad_zeros(2) + ":" + str(minutes).pad_zeros(2) + ":" + str(seconds_remainder).pad_zeros(2)

func begin():
	show()
	_count()

func _count():
	while true:
		await get_tree()\
			.create_timer(1.0)\
			.timeout
			
		seconds += 1
		update()
		
		print(label.text)
