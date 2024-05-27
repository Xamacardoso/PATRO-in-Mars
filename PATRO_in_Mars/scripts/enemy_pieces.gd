extends RigidBody2D


func _on_exited_screen_exited():
	queue_free()
