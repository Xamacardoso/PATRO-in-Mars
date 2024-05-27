extends CharacterBody2D

const enemy_pieces = preload("res://scenes/enemy_pieces.tscn")

@onready var animation_player = $AnimationPlayer as AnimationPlayer
@export var pieces : PackedStringArray
@export var hitpoints = 10
@export var impulse = 200

func break_sprite():
	for piece in pieces.size():
		var piece_instance = enemy_pieces.instantiate()
		get_parent().add_child(piece_instance)
		piece_instance.get_node("texture").texture = load(pieces[piece])
		piece_instance.global_position = global_position
		piece_instance.apply_impulse(Vector2(randi_range(-impulse,impulse), randi_range(-impulse, impulse * 2)))
	queue_free()
