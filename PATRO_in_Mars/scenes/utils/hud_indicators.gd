extends Control

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var health_bar = $Health/bar
@onready var battery_bar = $Baterry/bar

@onready var battery_initial_size = battery_bar.size.x
@onready var health_initial_size = health_bar.size.x



func _process(_delta):
	battery_bar.size.x = battery_initial_size * player.energy / player.max_energy