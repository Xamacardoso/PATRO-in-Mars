extends Area2D

@export var BULLET_SPEED = 600.0

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += BULLET_SPEED*delta*direction
