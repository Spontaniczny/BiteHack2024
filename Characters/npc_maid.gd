extends CharacterBody2D

var moveToVector: Dictionary = {
	"n": Vector2(0, -1),
	"ne": Vector2(1, -1),
	"e": Vector2(1, 0),
	"se": Vector2(1, 1),
	"s": Vector2(0, 1),
	"sw": Vector2(-1, 1),
	"w": Vector2(-1, 0),
	"nw": Vector2(-1, -1)
}

enum NPC_STATE { IDLE, WALK }

@export var move_speed : float = 20
@export var walk_time : float = 4
@export var idle_time : float = 3
@export var path : String = ""

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var sprite = $Sprite2D
@onready var timer = $Timer

var move_direction : Vector2 = Vector2.ZERO
var current_state : NPC_STATE = NPC_STATE.IDLE
var pathVector: Array[Vector2] = []
var currentMoveIndex = -1

func _ready():
	for move in path.split(" "):
		pathVector.append(moveToVector.get(move))
	select_new_direction()
	pick_new_state()


func _physics_process(_delta):
	if (current_state == NPC_STATE.WALK):
		velocity = move_direction * move_speed
		move_and_slide()


func select_new_direction():
	if(pathVector.size() == 0):
		move_direction = Vector2(
			randi_range(-1, 1),
			randi_range(-1, 1)
		)
	else:
		currentMoveIndex = (currentMoveIndex + 1) % pathVector.size()
		move_direction = pathVector[currentMoveIndex]

func pick_new_state():
	if(current_state == NPC_STATE.IDLE):
		state_machine.travel("Walk")
		while(move_direction == Vector2.ZERO):
			select_new_direction()
		current_state = NPC_STATE.WALK
		timer.start(walk_time)
	elif(current_state == NPC_STATE.WALK):
		state_machine.travel("Idle")
		current_state = NPC_STATE.IDLE
		move_direction = Vector2.ZERO
		timer.start(idle_time)
	if (move_direction != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_direction)
		animation_tree.set("parameters/Idle/blend_position", move_direction)


func _on_timer_timeout():
	pick_new_state()
