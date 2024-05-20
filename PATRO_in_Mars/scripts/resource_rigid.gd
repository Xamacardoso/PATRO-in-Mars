extends RigidBody2D
@export var impulseVector: Vector2 = Vector2.ZERO;

func _process(delta) -> void:
	var _sp = impulseVector.length() * 0.02;
	#_sp = 12.0
	impulseVector = impulseVector.move_toward(Vector2(0.0, 0.0), _sp)
	print("impulseVector: ", impulseVector)
	global_position.x += impulseVector.x;
	global_position.y += impulseVector.y;
