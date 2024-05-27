extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _process(_delta):
	if visible: look_at(get_node("/root/World/Ship").global_position)

func _on_visible_notifier_screen_entered():
	visible = false
	


func _on_visible_notifier_screen_exited():
	visible = true
