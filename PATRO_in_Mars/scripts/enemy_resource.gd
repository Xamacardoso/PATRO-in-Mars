extends Area2D

func _on_body_entered(body: Player) -> void:
	body.resources["blue_shard"]["amount"] += 1
	print("Global", Global.resources["blue_shard"]["amount"])
	print("Player", body.resources["blue_shard"]["amount"])
	queue_free()
