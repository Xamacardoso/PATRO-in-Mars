extends Area2D

@onready var parent = get_parent()

@onready var DAMAGE = parent.DAMAGE
@onready var collision = $CollisionShape2D
@onready var disable_hit_box_timer = $DisableHitBoxTimer

func tempdisable() -> void:
	collision.call_deferred("set", "disabled", true)
	disable_hit_box_timer.start()
	


func _on_disable_hit_box_timer_timeout():
	collision.call_deferred("set", "disabled", false)
