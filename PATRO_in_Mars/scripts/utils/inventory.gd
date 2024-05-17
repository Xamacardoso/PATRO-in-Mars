extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("inventory"):
		visible = !visible
		get_tree().paused = visible
