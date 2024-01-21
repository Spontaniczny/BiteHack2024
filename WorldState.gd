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

@onready var achievement_popup_scene = get_node("AchievementPopUp")

func _init():
	current = State.INIT
	achievements = Collection.new()
	
func _show_achievement_popup(ach: Collection.Achievement):
	achievement_popup_scene.display(ach)
	
# place for state transition logic:
func _on_watering_can_activated():  # example signal callback
	match current:
		State.INIT:
			current = State.DISCOVERED
			
		_:
			pass

func _on_watering_can_skipped():
	pass

func _on_watering_can_achieved():
	const ach = Collection.Achievement.WATERING_CAN
	
	if achievements.is_acquired(ach): 
		return
	
	achievements.acquire(ach)
	
	print("Got achievement: Pick up watering can") # call mini window display instead
	_show_achievement_popup(ach)

func _ready():
	pass 

func _process(_delta):
	pass

func _on_tree_exiting():
	if save_achievements:
		achievements.save()
