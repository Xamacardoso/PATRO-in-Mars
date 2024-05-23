extends StaticBody2D

@export var max_hp = 1000
var hp = max_hp

@onready var health_bar = $ShipHealthBar/Bar
@onready var health_bar_initial_size = health_bar.size.x
@onready var ship_outline = $ShipOutline

@onready var player = get_tree().get_first_node_in_group("Player")

@onready var necessary1_label = $ShipPanel/NecessaryResource1/Label
@onready var necessary2_label = $ShipPanel/NecessaryResource2/Label
@onready var necessary3_label = $ShipPanel/NecessaryResource3/Label

var can_win = false

var necessary_resources = ["dark_shard","hematite_element","iron_element"]
var necessary_resources_dict = {
	"iron_element":{
		"name": "Iron Bar",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/iron bar.png"),
		"amount":20
	},
	"hematite_element":{
		"name": "Pure Hematite Fragment",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/hematite.png"),
		"amount":25
	},
	"dark_shard":{
		"name": "Dark Martian Matter",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/shard_01i.png"),
		"amount":40
	},
}
var ship_inventory = {
	"iron_element":{
		"name": "Iron Bar",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/iron bar.png"),
		"amount":0
	},
	"hematite_element":{
		"name": "Pure Hematite Fragment",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/hematite.png"),
		"amount":0
	},
	"dark_shard":{
		"name": "Dark Martian Matter",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/shard_01i.png"),
		"amount":0
	},
}

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ship_outline.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact") and player_in_range:
			print("O player entrou na area E INTERAGIU")
			for recurso in necessary_resources:
				ship_inventory[recurso]["amount"] += player.resources[recurso]["amount"]
				player.resources[recurso]["amount"] -= player.resources[recurso]["amount"]
				print("Eu tenho essa quantidade de ", str(ship_inventory[recurso]["name"]), " : " , ship_inventory[recurso]["amount"])
				update_ship_labels()
				check_if_can_win()
				if can_win: player.win()

func update_ship_labels():
	necessary1_label.text = str(ship_inventory["iron_element"]["amount"]) + " / " + str(necessary_resources_dict["iron_element"]["amount"])
	necessary2_label.text = str(ship_inventory["hematite_element"]["amount"]) + " / " + str(necessary_resources_dict["hematite_element"]["amount"])
	necessary3_label.text = str(ship_inventory["dark_shard"]["amount"]) + " / " + str(necessary_resources_dict["dark_shard"]["amount"])


func _on_interaction_area_body_entered(body):
	if body.is_in_group("Player"): 
		print("O player entrou na area")
		player_in_range = true
		ship_outline.visible = !ship_outline.visible
		$ShipPanel.visible = !$ShipPanel.visible
		update_ship_labels()

func check_if_can_win():
	can_win = true
	for recurso in necessary_resources:
		if ship_inventory[recurso]["amount"] < necessary_resources_dict[recurso]["amount"]:
			can_win = false
			break

func _on_interaction_area_body_exited(body):
	if body.is_in_group("Player"):
		print("O player saiu da área.")
		player_in_range = false
		ship_outline.visible = !ship_outline.visible
		$ShipPanel.visible = !$ShipPanel.visible
		update_ship_labels()

func _on_hurt_box_hurt(DAMAGE):
	hp -= DAMAGE
	health_bar.size.x = health_bar_initial_size * hp / max_hp
	if hp <= 0:
		Global.transition_to_scene("game_over")
