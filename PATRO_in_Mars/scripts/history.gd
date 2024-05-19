extends Control

@onready var back_button = $Button as Button



func _ready():
	back_button.button_down.connect(on_main_menu_pressed)
	
	
func on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	

	

