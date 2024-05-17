extends Area2D

func _physics_process(_delta):
	var targets_in_range = get_overlapping_bodies()
	if targets_in_range.size() > 0:
		var target = targets_in_range.front()
		look_at(target.global_position)

func shoot() -> void:
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)

func _on_shoot_cooldown_timeout():
	shoot()
