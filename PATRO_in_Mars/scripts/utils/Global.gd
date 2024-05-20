extends Node

@onready var can_pause = true
@onready var transition_scene : PackedScene = preload("res://scenes/utils/fade_in_transition.tscn")

## Database de itens
var resources := {
	"copper_element":{
		"name": "Copper Bar",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/copper bar.png"),
		"amount":0
	},
	"bronze_element":{
		"name": "Bronze Bar",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/bronze bar.png"),
		"amount":0
	},
	"iron_element":{
		"name": "Iron Bar",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/iron bar.png"),
		"amount":0
	},
	"granite_element":{
		"name": "Granite Fragment",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/granite.png"),
		"amount":0
	},
	"item5":{
		"name": "item5",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/copper bar.png"),
		"amount":0
	},
	"item6":{
		"name": "item6",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/copper bar.png"),
		"amount":0
	},
}

## Database de consumiveis
var consumables := {
	"battery":{
		"name": "Battery",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/consumables/battery.png"),
		"amount":0
	},
	"rudimentar_plating":{
		"name": "Rudimentar Plating",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/consumables/rudimentar_plating.png"),
		"amount":0
	},
	"flux_overloader":{
		"name": "Flux Overloader",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/consumables/flux_overloader.png"),
		"amount":0
	},
}

## Cenas principais
var main_scenes := {
	"game" : preload("res://scenes/world.tscn"),
	"history" : preload("res://scenes/history.tscn"),
	"main_menu" : preload("res://scenes/main_menu.tscn")
}

var damage_holder = 0

## Função que transiciona as cenas
func transition_to_scene(destiny_scene: String) -> void:
	var trans = transition_scene.instantiate()
	trans.destiny_scene = destiny_scene
	add_child(trans)
	
