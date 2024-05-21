extends Node2D
@onready var resource_box = preload("res://scenes/resource_box.tscn")
@onready var spawn_timer = $ResourceBoxSpawnTimer
@onready var resource_boxes_node = $".."

@onready var top_left = $TopLeft
@onready var top_right = $TopRight
@onready var bottom_left = $BottomLeft
@onready var bottom_right = $BottomRight



func _ready():
	spawn_timer.start()


func _on_resource_box_spawn_timer_timeout():
	spawn_resource_box(resource_box)
	spawn_timer.start()

func spawn_resource_box(jazida):
	var jazida_spawn = jazida.instantiate()
	jazida_spawn.global_position = get_random_resourcebox_position()
	add_child(jazida_spawn)

func get_random_resourcebox_position():
	var sup_left = top_left.global_position
	var sup_right= top_right.global_position
	var bot_left = bottom_left.global_position
	var bot_right= bottom_right.global_position
	
	return Vector2(randf_range(sup_left.x, sup_right.x), randf_range(sup_left.y,bot_right.y))

