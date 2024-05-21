extends CanvasLayer


@onready var continue_btn : Button = $Menu/continue_btn

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") and Global.can_pause:
		visible = !visible
		get_tree().paused = visible
		continue_btn.grab_focus()



func _on_continue_btn_pressed():
	get_tree().paused = false
	visible = false
	

func _on_get_out_btn_pressed():
	Global.transition_to_scene("main_menu")
	get_tree().paused = false
