extends Control

@onready var restart = $VBoxContainer2/Restart as Button
@onready var main_menu = $VBoxContainer2/MainMenu as Button

func _ready():
	restart.grab_focus()
	$LastTimeLabel.text = Global.last_time

func _on_restart_pressed():
	Global.transition_to_scene("game")


func _on_main_menu_pressed():
	Global.transition_to_scene("main_menu")
