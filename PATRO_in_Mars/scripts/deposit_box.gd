extends CharacterBody2D

const deposit_pieces = preload("res://scenes/deposit_pieces.tscn")
const resource_instance = preload("res://scenes/resource_rigid.tscn")

@onready var animation_player = $AnimationPlayer  as AnimationPlayer
@onready var spawn_resource = $"spawn-resource" as Marker2D
@export var pieces : PackedStringArray
@export var hp = 2
var impulse = 50

func _process(_delta) -> void:
	if hp <= 0:
		queue_free()

#Verificando varredura do array e instanciando pedaços
func break_sprite():
	for piece in pieces.size():
		var piece_instance = deposit_pieces.instantiate()
		get_parent().add_child(piece_instance)
		piece_instance.get_node("texture").texture = load(pieces[piece])
		piece_instance.global_position = global_position
		piece_instance.apply_impulse(Vector2(randi_range(-impulse, impulse), randi_range(-impulse, -impulse * 2)))
	queue_free()
		
func create_resource():
	var resource = resource_instance.instantiate()
	get_parent().call_deferred("add_child", resource)
	resource.global_position = spawn_resource.global_position #A posição do marker2d vai ser onde o recurso será instanciado
	resource.apply_impulse(Vector2(randi_range(-50, 50), -150)) #Aplicação do impulse também feito na func acima.
