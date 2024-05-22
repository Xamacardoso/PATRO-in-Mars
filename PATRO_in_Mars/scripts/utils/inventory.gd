extends Control

@onready var player = get_tree().get_first_node_in_group("Player")
var battery_needs = ["blue_shard","hematite_element"]
var can_craft_battery = false


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	
func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		Global.can_pause = !Global.can_pause
		visible = !visible
		get_tree().paused = visible
		print("Inventario apareceu")



func _on_button_pressed():
	if can_craft_battery:
		pass
	player.consumables["battery"]["amount"] += 1
	print("Recebi uma bateria, meu numero de baterias é : ", player.batteries )

