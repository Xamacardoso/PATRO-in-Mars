extends Control

@onready var back_button = $Button as Button

func _ready():
	back_button.button_down.connect(on_pause_menu_game_pressed)
	
	
func on_pause_menu_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/pause_menu.tscn")
