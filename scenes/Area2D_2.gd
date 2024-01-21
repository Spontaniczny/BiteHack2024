extends Area2D


var entered = false

func _physics_process(_delta):
	if entered:
		print("test3")
		if Input.is_action_just_pressed("Interact"):
			get_tree().change_scene_to_file("res://scenes/basement.tscn")



func _on_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	entered = true


func _on_body_shape_exited(_body_rid, _body, _body_shape_index, _local_shape_index):
	entered = false
