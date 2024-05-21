extends Control
@onready var restart = $VBoxContainer2/restart as Button
@onready var exit = $VBoxContainer2/exit as Button

# Called when the node enters the scene tree for the first time.
func _ready():
	restart.button_down.connect(on_start_pressed)
	exit.button_down.connect(on_exit_pressed)
	restart.grab_focus()
	
	
func on_start_pressed() -> void:
	Global.transition_to_scene("game")


func on_exit_pressed() -> void:
	Global.transition_to_scene("main_menu")



