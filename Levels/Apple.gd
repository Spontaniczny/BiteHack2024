extends Sprite2D

var mouse_in: bool
var hitbox

signal activated
signal skipped
signal achieved

func activate():
	activated.emit()

func skip():
	skipped.emit()
	
func achieve():
	achieved.emit()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_2_body_entered(body):
	activated.emit()
