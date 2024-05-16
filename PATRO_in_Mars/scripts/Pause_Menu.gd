extends CanvasLayer


@onready var continue_btn = $Menu/continue_btn
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true
		continue_btn.grab_focus()










func _on_continue_btn_pressed():
	get_tree().paused = false
	visible = false
	
	
	


func _on_get_out_btn_pressed():
	get_tree().quit()
