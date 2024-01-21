extends Node2D
@export var inside_scene :PackedScene#= PackedScene.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	y_sort_enabled = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_way_body_entered(body):
	body.house = self

func _on_door_way_body_exited(body):
	if body.house == self:
		body.house = null

func enter():
	if inside_scene:
		get_tree().change_scene_to_packed(inside_scene)
	#get_tree().change_scene(inside_scene.resource_path)
	print("enter house")
