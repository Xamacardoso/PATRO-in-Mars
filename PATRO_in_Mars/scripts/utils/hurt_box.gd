extends Area2D


@export_enum("Cooldown", "HitOnce","DisableHitBox") var HurtBoxType = 0

@onready var collision = $CollisionShape2D
@onready var disable_timer = $DisableTimer

signal hurt(DAMAGE)


func _on_area_entered(area):
	print(area, " entrou em mim e o dano dela é ", area.DAMAGE)
	if area.get("DAMAGE") != null:
		match HurtBoxType:
			0: # Cooldown
				collision.call_deferred("set","disabled", true)
				disable_timer.start()
			1: # HitOnce
				pass
			2: # DisableHitBox
				if area.has_method("tempdisable"):
					area.tempdisable()
					
		var DAMAGE = area.DAMAGE
		emit_signal("hurt",DAMAGE)


func _on_disable_timer_timeout():
	collision.call_deferred("set", "disabled", false)
