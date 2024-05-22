extends Control

@onready var continue_button = $Button as Button

func _ready():
	continue_button.button_down.connect(on_start_game_pressed)


func on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")
