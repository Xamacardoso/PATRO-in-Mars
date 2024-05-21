extends Control

@onready var player = get_tree().get_first_node_in_group("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("inventory"):
		Global.can_pause = !Global.can_pause
		visible = !visible
		get_tree().paused = visible


func _on_button_pressed():
	player.batteries += 1
