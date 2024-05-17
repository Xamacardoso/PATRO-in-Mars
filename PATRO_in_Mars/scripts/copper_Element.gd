extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body: Player) -> void:
	body.resources["item1"]["amount"] += 1
	print("Global", Global.resources["item1"]["amount"])
	print("Player", body.resources["item1"]["amount"])
	queue_free()
