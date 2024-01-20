extends Node

class_name PlotState

enum State {
	INIT,
	DISCOVERED, # body discovered ;v
	# etc.
}

var current: State

# plot triggers:
var bloodied_knife: Trigger


func _init():
	current = State.INIT
	
	# all trigger references and connections go here:
	bloodied_knife = get_node("something")  # example item
	bloodied_knife.activated.connect(_on_bloodied_knife_activated)  # connect to signal "taken"
	bloodied_knife.skipped.connect(_on_bloodied_knife_skipped)
	
	
# place for state transition logic:
func _on_bloodied_knife_activated():  # example signal callback
	if current == State.DISCOVERED:
		pass
		
func _on_bloodied_knife_skipped():
	pass

func _ready():
	pass 

func _process(_delta):
	pass
