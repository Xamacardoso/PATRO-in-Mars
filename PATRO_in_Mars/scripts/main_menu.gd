class_name MainMenu 
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer2/Start_Button as Button


@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer2/Exit_Button as Button
@export var start_level = preload("res://scenes/world.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	start_button.grab_focus()
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
	


func on_exit_pressed() -> void:
	get_tree().quit()
	
