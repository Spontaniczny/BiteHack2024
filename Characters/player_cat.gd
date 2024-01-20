extends CharacterBody2D

@export var move_speed: float = 75


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
