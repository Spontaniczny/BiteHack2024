extends Sprite2D

signal activated
signal skipped
signal achieved

func activate():
	activated.emit()

func skip():
	skipped.emit()

func achieve():
	achieved.emit()

func _on_area_2d_body_entered(body):
	activate()
	achieve()
	queue_free()
