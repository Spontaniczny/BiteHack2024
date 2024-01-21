extends Node

class_name Collection

const Properties = preload("res://scripts/achievements/AchievementProperties.gd")

enum Achievement {
	WATERING_CAN
}

const information := {
	Achievement.WATERING_CAN: {
		"title": "Watering Can",
		"description": "Pick up watering can"
	}
}

const destination := "res://saves/achievements.json"

var collection: Dictionary = {}

func acquire(ach: Achievement):
	collection[ach] = true
	
func is_acquired(ach: Achievement) -> bool:
	return collection.has(ach)

func reset():
	collection = {}
	
func save():
	var data := JSON\
		.new()\
		.stringify(collection)
	
	FileAccess\
		.open(destination, FileAccess.WRITE)\
		.store_string(data)
	
func _load():
	var data := FileAccess\
		.open(destination, FileAccess.READ)\
		.get_as_text()
		
	collection = JSON\
		.parse_string(data)

	print("Loaded achievements:")
	print(collection)

func _init():
	_load()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
