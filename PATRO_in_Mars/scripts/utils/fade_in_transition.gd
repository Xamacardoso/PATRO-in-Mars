extends CanvasLayer

## Packed scene destino da transição
@export var destiny_scene : String
var progress := 0.0
@onready var color_rect : ColorRect = get_node("ColorRect")

func _process(delta):
	progress = move_toward(progress, 1.0, 1.2*delta)
	color_rect.color.a = progress
	if progress >= 1.0:
		get_tree().change_scene_to_packed(Global.main_scenes.get(destiny_scene))
		queue_free()
