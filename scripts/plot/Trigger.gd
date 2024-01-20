extends Node

class_name Trigger

# convention: every plot trigger can be activated or skipped (e.g. picked up or not)

signal activated
signal skipped

func activate():
	activated.emit()

func skip():
	skipped.emit()

func _init():
	pass

func _ready():
	pass

func _process(delta):
	pass
