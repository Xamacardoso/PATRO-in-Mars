extends Area2D


func _on_body_entered(body: Player) -> void:
	body.resources["hematite_element"]["amount"] += 1
	print("Global", Global.resources["hematite_element"]["amount"])
	print("Player", body.resources["hematite_element"]["amount"])
	queue_free()
