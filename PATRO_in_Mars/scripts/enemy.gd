extends CharacterBody2D

@export var SPEED = 20.0
@export var hp = 10
@onready var player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = SPEED*direction
	move_and_slide()
	if hp <= 0:
		hp = 0
		queue_free()
