extends Area2D
@onready var gun_sprite = $WeaponPivot/WeaponSprite
@onready var player = get_parent()
@onready var player_damage = player.get("DAMAGE")
var DAMAGE = 0.0

func _ready() -> void:
	DAMAGE = player.DAMAGE

## Calcula quantos inimigos tem em volta e olha pro mais próximo
func _physics_process(_delta):
	#print("MEU DANO E O DANO DO PLAYER: ", DAMAGE)
	var targets_in_range = get_overlapping_areas()
	if targets_in_range.size() > 0:
		var target = targets_in_range.front()
		look_at(target.global_position)
		gun_sprite.flip_v = true if (global_rotation > 1.5 or global_rotation < -1.5) else false

## Atirar
func shoot() -> void:
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)

func _on_shoot_cooldown_timeout():
	shoot()
