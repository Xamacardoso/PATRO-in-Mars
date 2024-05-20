extends RigidBody2D

var item_choice: PackedScene;


## Dicionário de possíveis recursos:
var dictionary = {
	0: preload("res://scenes/copper_resource.tscn"),
	1: preload("res://scenes/bronze_resource.tscn"),
	2: preload("res://scenes/granite_resource.tscn"),
	3: preload("res://scenes/iron_resource.tscn")
}

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

# Fazendo uma escolha aleatória dos itens no dicionário e printando na tela
func _ready():
	var random_number = randi() % dictionary.size()
	item_choice = dictionary[random_number] as PackedScene
	print("Item escolhido pela jazida: ", item_choice)
	
	var _spawnedResource = item_choice.instantiate()
	add_child(_spawnedResource);
	

