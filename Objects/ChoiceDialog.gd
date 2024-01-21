extends PopupPanel

const Choice = preload("res://scripts/plot/Choice.gd")

signal yes
signal no

@onready var dialog_title = $"ColorRect/VBoxContainer2/VBoxContainer2/Title"
@onready var description = $"ColorRect/VBoxContainer2/VBoxContainer2/Description"
@onready var option1 = $"ColorRect/VBoxContainer2/VBoxContainer/Option1"
@onready var option2 = $"ColorRect/VBoxContainer2/VBoxContainer/Option2"

func display(choice: Choice):
	dialog_title = choice.title
	description = choice.description
	option1.text = choice.yes_description
	option2.text = choice.no_description

func _ready():
	option1.pressed.connect(_on_option1_pressed)
	option2.pressed.connect(_on_option2_pressed)
	
func _on_option1_pressed():
	yes.emit()
	
func _on_option2_pressed():
	no.emit()
