extends Area2D


func _ready():
	$DespawnTimer.start()

func _on_body_entered(body: Player) -> void:
	body.resources["dark_shard"]["amount"] += 1
	print("Global", Global.resources["dark_shard"]["amount"])
	print("Player", body.resources["dark_shard"]["amount"])
	queue_free()




func _on_despawn_timer_timeout():
	queue_free()
