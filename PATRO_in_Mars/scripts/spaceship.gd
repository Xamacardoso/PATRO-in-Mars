extends StaticBody2D

@export var max_hp = 1500
var hp = max_hp

@onready var health_bar = $ShipHealthBar/Bar
@onready var health_bar_initial_size = health_bar.size.x
@onready var ship_outline = $ShipOutline

@onready var player = get_tree().get_first_node_in_group("Player")

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


func _on_hurt_box_hurt(DAMAGE):
	hp -= DAMAGE
	health_bar.size.x = health_bar_initial_size * hp / max_hp
	if hp <= 0:
		queue_free()
		Global.transition_to_scene("game_over")

# A ideia é criar um sistema que detecte a colisão do player com a nave e absorva todo o conteúdo do inventário do
# player ao acontecer essa colisão.Tentarei usar o inventário e deixar claro para o sistema que existem valores ali
#,ou seja,o sistema tem que perceber que os valores mudaram à medida que o jogador coleta mais recursos.

#var max_recursos = 50 # Quantidade máxima de recursos que a nave pode armazenar
#var recursos_no_inventario = preload("res://scenes/utils/inventory.tscn") # A cena do inventário atualiza os valores conforme coleta de recursos,então talvez esse valores possam ser transferidos para nave
#var recursos_da_transferencia: Array = recursos_no_inventario.values() # Quando o inventário atualiza valores,esses valores são carregados aqui e vão ser transferidos para a nave no momento da colisão
#var recursos_na_nave = 0


func _on_interaction_area_body_entered(body):
	if body.is_in_group("Player"): 
		print("O player entrou na area")
		player_in_range = true
		ship_outline.visible = !ship_outline.visible
		#if recursos_na_nave >= max_recursos: #Ao detectar a cena pré-carregada do player em sua área, os recursos na nave,que são zero inicialmente, usarão os valores no inventário para se atualizarem
			#recursos_na_nave == 50
		#else:
			#recursos_na_nave += recursos_da_transferencia #Há um limite para os recursos da nave serem atualizados.


func _on_interaction_area_body_exited(body):
	if body.is_in_group("Player"):
		print("O player saiu da área.")
		player_in_range = false
		ship_outline.visible = !ship_outline.visible
