extends TextureRect

class_name ResourceGrid

@export var my_key := '' 
@onready var icon_node : TextureRect = get_node("Icon")
@onready var label_node : Label = get_node("Label")
@onready var player = get_tree().get_first_node_in_group("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	update_properties()
	

## Pega o dicionario desse item, se for nulo retorna um dicionario vazio
func get_item_dict() -> Dictionary:
	var my_dict = player.consumables.get(my_key) 
	if my_dict == null: return {}
	return my_dict


## Atualiza as propriedades como icone, label, etc.
func update_properties() -> void:
	var my_dict = get_item_dict()
	if my_dict.is_empty() : return
	icon_node.texture = my_dict["icon"]
	label_node.text = str(my_dict["amount"])


func _process(_delta):
	modulate.a = 0.31 if get_item_dict().get("amount") == 0 else 1.0
	update_properties()
	
