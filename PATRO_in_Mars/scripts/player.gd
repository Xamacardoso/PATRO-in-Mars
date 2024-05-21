extends CharacterBody2D
class_name Player


@onready var player_sprite = $PlayerSprite

@onready var label_battery = $Label
@onready var battery_timer : Timer = $BatteryTimer

# Inventário do player
@onready var resources := Global.resources.duplicate(true)
@onready var consumables := Global.consumables.duplicate(true)

signal player_died

func _ready() -> void:
	battery_timer.start()

# Stats do Player
var hp = 100.0
var max_health = 100.0
var health_recovery = 1.0
var max_energy = 15.0
var energy = max_energy
@export var DAMAGE = 10.0
@export var SPEED = 30.0

@onready var batteries = consumables["battery"]["amount"]


func _physics_process(_delta):
	movement()
	Global.damage_holder = DAMAGE
	
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
		

func game_over() -> void:
	queue_free()

signal add_item

func _unhandled_input(event):
	if event.is_action_pressed("debug_additem"):
		resources["dark_shard"]["amount"] += 1
		print(resources["dark_shard"]["amount"])
	elif event.is_action_pressed("debug_addbattery"):
		consumables["battery"]["amount"] += 1
		batteries = consumables["battery"]["amount"]
		print("Meu inventario tem isso de baterias: " ,consumables["battery"]["amount"])
		print("Eu tenho essa quantidade de baterias: " , batteries)

## Diminui a bateria em 1 a cada segundo
func _on_battery_timer_timeout():
	energy -= 1
	if energy == 0:
		if consumables["battery"]["amount"] >= 1:
			energy = max_energy
			consumables["battery"]["amount"] -= 1
			batteries = consumables["battery"]["amount"]
			print(batteries)
		else:
			get_tree().change_scene_to_file("res://scenes/game_over_menu.tscn")
			
	battery_timer.start()

## Tomar hits
func _on_hurt_box_hurt(DAMAGE):
	hp -= DAMAGE
	print(hp)
	if hp <= 0:
		queue_free()
		
