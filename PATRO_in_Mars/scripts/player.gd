extends CharacterBody2D
class_name Player


@onready var player_sprite = $PlayerSprite
@onready var DAMAGE = 10.0
@export var SPEED = 30.0

@onready var label_battery = $Label

# Inventário do player
@onready var resources := Global.resources.duplicate(true)
@onready var consumables := Global.consumables.duplicate(true)

@onready var BatteryTimer = $BatteryTimer


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

## Animações do player
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
		
	
# Stats do Player
var health = 100.0
var max_health = 100.0
var health_recovery = 1.0
var energy = 70
var energy_timer = BatteryTimer

signal player_stats_changed()

func game_over() -> void:
	queue_free()

func _on_battery_timer_ready():
	energy_timer.connect(energy_timer, _on_battery_timer_timeout())
	energy_timer.start()

## Diminui a bateria em 1 a cada segundo
func _on_battery_timer_timeout():
	energy -= 1
	if energy == 0: game_over()
	label_battery.text = str(energy)
