extends Control

@onready var back_button = $Button as Button

func _ready():
	back_button.button_down.connect(on_pause_menu_game_pressed)
	
	
func on_pause_menu_game_pressed() -> void:
	visible = !visible
	$"../Menu".visible = !$"../Menu".visible
