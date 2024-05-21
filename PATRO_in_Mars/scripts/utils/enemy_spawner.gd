extends Node2D

@export var spawns: Array[SpawnInfo] = []
@onready var player = get_tree().get_first_node_in_group("Player")

var time = 0

func _on_timer_timeout():
	time += 1
	var enemy_spawns = spawns
	for enem in enemy_spawns:
		if time >= enem.time_start and time <= enem.time_end:
			if enem.spawn_delay_counter < enem.enemy_spawn_delay:
				enem.spawn_delay_counter += 1
			else:
				enem.spawn_delay_counter = 0
				print(enem.enemy.resource_path)
				var new_enemy = load(str(enem.enemy.resource_path))
				var counter = 0
				while counter < enem.enemy_num:
					var enemy_spawn = new_enemy.instantiate()
					enemy_spawn.global_position = get_random_position()
					add_child(enemy_spawn)
					counter += 1

func get_random_position():
	var vpr = (get_viewport_rect().size/2.5) * randf_range(1.1,1.3)
	var top_left = Vector2(player.global_position.x - vpr.x/2, player.global_position.y - vpr.y/2)
	var top_right = Vector2(player.global_position.x + vpr.x/2, player.global_position.y - vpr.y/2)
	var bottom_left = Vector2(player.global_position.x - vpr.x/2, player.global_position.y + vpr.y/2)
	var bottom_right = Vector2(player.global_position.x + vpr.x/2, player.global_position.y + vpr.y/2)
	
	var pos_side = ["up", "down", "left", "right"].pick_random()
	var spawn_pos1 = Vector2.ZERO
	var spawn_pos2 = Vector2.ZERO
	
	match pos_side:
		"up":
			spawn_pos1 = top_left
			spawn_pos2 = top_right
		"down":
			spawn_pos1 = bottom_left
			spawn_pos2 = bottom_right
		"left":
			spawn_pos1 = top_left
			spawn_pos2 = bottom_left
		"right":
			spawn_pos1 = top_right
			spawn_pos2 = bottom_right
	
	# picks a random coordinate of the side to spawn the enemy
	var x_spawn = randf_range(spawn_pos1.x , spawn_pos2.x)
	var y_spawn = randf_range(spawn_pos1.y , spawn_pos2.y)
	
	# returns the position to be spawned
	return Vector2(x_spawn, y_spawn)
