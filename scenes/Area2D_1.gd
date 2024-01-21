extends Area2D


var entered = false
var spawn_position = Vector2(500, 500)  # Adjust the coordinates as needed

func _physics_process(_delta):
	if entered:
		print("test_basement")
		if Input.is_action_just_pressed("Interact"):
			get_tree().change_scene_to_file("res://Levels/main.tscn")
			var player = get_node("../PlayerCat")  # Assuming player is in a group named "player"
			if player:
				player.position = spawn_position

func _on_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	print("aha")
	entered = true


func _on_body_shape_exited(_body_rid, _body, _body_shape_index, _local_shape_index):
	entered = false
