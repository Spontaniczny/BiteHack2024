extends Node
class_name WorldState

const Collection = preload("res://scripts/achievements/Collection.gd")

const save_achievements := false

enum State {
	INIT,
	DISCOVERED, # body discovered ;v
	# etc.
}

var current: State
var achievements: Collection
var inventory: Inventory

@onready var achievement_popup_scene = get_node("Interface/AchievementPopUp")
@onready var choice_dialog = get_node("Interface/ChoiceDialog")
@onready var message_dialog = get_node("Interface/MessageDialog")

func _init():
	current = State.INIT
	achievements = Collection.new()
	inventory = Inventory.new()
	
func _show_achievement_popup(ach: Collection.Achievement):
	achievement_popup_scene.display(ach)
	
# place for state transition logic:
func _on_watering_can_activated():  # example signal callback
	inventory.acquire(Inventory.Item.WATERING_CAN)

func _on_watering_can_skipped():
	pass

func _on_watering_can_achieved():
	const ach = Collection.Achievement.WATERING_CAN
	
	if achievements.is_acquired(ach): 
		return
	
	achievements.acquire(ach)
	
	print("Got achievement: Pick up watering can") # call mini window display instead
	#_show_achievement_popup(ach)
	message_dialog.display("You pick up an old rusty watering can")

func _ready():
	pass 

func _process(_delta):
	pass

func _on_tree_exiting():
	if save_achievements:
		achievements.save()

func _on_choice_dialog_no():
	match current:
		_:
			pass

func _on_choice_dialog_yes():
	match current:
		_:
			pass

func _on_apple_achieved():
	const ach = Collection.Achievement.APPLE
	
	if achievements.is_acquired(ach): 
		return
	
	achievements.acquire(ach)
	
	#print("Got achievement: Pick up watering can") # call mini window display instead
	_show_achievement_popup(ach)

func _on_apple_activated():
	inventory.acquire(Inventory.Item.APPLE)

func _on_apple_skipped():
	pass
