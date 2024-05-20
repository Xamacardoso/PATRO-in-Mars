extends CanvasLayer

var progress : float = 1.0
@onready var color_rect : ColorRect = get_node("ColorRect")

func _ready():
	visible = true

func _process(delta):
	progress = move_toward(progress, 0.0, 0.0015)
	color_rect.color.a = progress
	if progress <= 0.0:
		queue_free()
