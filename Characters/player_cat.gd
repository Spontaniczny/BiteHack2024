extends CharacterBody2D

@export var move_speed: float = 75
#@export var starting_tree : Vector2 = Vector2(0, 1)
@export var starting_direction : Vector2 = Vector2(0, 1)

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

var house = null 

func _ready():
	#animation_tree.set("parameters/idle/blend_position", starting_tree)
	update_animation_parameters(starting_direction)
  set_house(null)


func set_house(new_house):
	house = new_house
	
	
func _unhandled_input(event):
	if event is InputEventKey and event.is_action_pressed("Interact") and house != null:
		house.enter()

func _physics_process(delta):
	# get input
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	update_animation_parameters(input_direction)
	
	# update velocity
	velocity = input_direction * move_speed
	
	# Move and slide
	move_and_slide()
	pick_new_state()
	
func update_animation_parameters(move_input: Vector2):
	if (move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)
		
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle") 
	
	
	
