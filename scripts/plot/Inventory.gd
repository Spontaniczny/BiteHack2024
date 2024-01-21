class_name Inventory

enum Item {
	WATERING_CAN
}

var state: Dictionary

func _init():
	state = {}
	
func has(item: Item) -> bool:
	return state.has(item) and state[item]

func acquire(item: Item):
	state[item] = true
	
func drop(item: Item):
	state[item] = false
