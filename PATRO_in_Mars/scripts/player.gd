extends CharacterBody2D
class_name Player

@onready var player_sprite = $PlayerSprite
@export var SPEED = 30.0


func _physics_process(_delta):
	movement()

## Handles player movement
func movement() -> void:
	# Picks the direction the player is pressing on the keyboard, and calculates where the player is going
	var x_movement = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_movement = Input.get_action_strength("down") - Input.get_action_strength("up")
	var movementvector = Vector2(x_movement, y_movement)
	# Vectorizes player movement
	velocity = movementvector.normalized()*SPEED
	play_animation(movementvector)
	move_and_slide()


func play_animation(movementvector) -> void:
	if movementvector:
		if movementvector.x:
			player_sprite.play("walk_h")
			if movementvector.x > 0:
				player_sprite.flip_h = true
			elif movementvector.x < 0:
				player_sprite.flip_h = false
		else:
			if movementvector.y > 0:
				player_sprite.play("walk_down")
			elif movementvector.y < 0:
				player_sprite.play("walk_up")
	else:
		player_sprite.play("idle")
		
	
