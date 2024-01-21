extends CharacterBody2D

@export var move_speed: float = 75

var house = null 

func set_house(new_house):
	house = new_house
	
func _ready():
	set_house(null)
	
func _unhandled_input(event):
	if event is InputEventKey and event.is_action_pressed("Interact") and house != null:
		house.enter()

func _physics_process(delta):
	# get input
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	# update velocity
	velocity = input_direction * move_speed
	
	# Move and slide
	move_and_slide()
