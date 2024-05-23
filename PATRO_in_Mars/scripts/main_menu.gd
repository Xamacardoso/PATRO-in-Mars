class_name MainMenu 
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer2/Start_Button as Button
@onready var button2 = $MarginContainer/HBoxContainer/VBoxContainer2/Button2 as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer2/Exit_Button as Button
@export var start_level = preload("res://scenes/world.tscn") as PackedScene
@export var button2_level = preload("res://scenes/history.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	start_button.grab_focus()
	button2.button_down.connect(on_button2_pressed)
	
func on_start_pressed() -> void:
	#get_tree().change_scene_to_packed(start_level)
	Global.transition_to_scene("introduction")
	
func on_button2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/history.tscn")

func on_exit_pressed() -> void:
	get_tree().quit()
	
#
