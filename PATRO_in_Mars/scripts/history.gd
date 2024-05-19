extends Control

@onready var back_button = $Button as Button
@export var main_menu_level = preload("res://scenes/main_menu.tscn") as PackedScene


func _ready():
	back_button.button_down.connect(on_main_menu_pressed)
	
	
func on_main_menu_pressed() -> void:
	get_tree().change_scene_to_packed(main_menu_level)
	

	

