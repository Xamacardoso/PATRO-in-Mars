extends Area2D

func _ready():
	$Timer.start()

func _on_body_entered(body: Player) -> void:
	body.resources["copper_element"]["amount"] += 1
	print("Global ", Global.resources["copper_element"]["amount"])
	print("Player ", body.resources["copper_element"]["amount"])
	queue_free()




func _on_timer_timeout():
	queue_free()
