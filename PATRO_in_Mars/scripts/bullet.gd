extends Area2D
class_name Bullet

@onready var player_damage = get_tree().get_first_node_in_group("Player").DAMAGE

@export var BULLET_SPEED = 600.0
@onready var DAMAGE = player_damage

## Processa a direção e movimento da bala
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += BULLET_SPEED*delta*direction

## Quando a bala sai de cena, ela é excluida
func _on_bullet_screen_notifier_screen_exited():
	queue_free()


## Hit da bala
func _on_area_entered(area):
	area.hp -= DAMAGE
	
	if area.hp < 0:
		area.break_sprite()
	else:
		area.animation_player.play("hit")
		area.create_resource() #chamando nossa função para surgimento do recurso
