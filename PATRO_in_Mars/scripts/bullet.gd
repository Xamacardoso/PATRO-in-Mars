extends Area2D
class_name Bullet

@onready var player = get_tree().get_first_node_in_group("Player")
var player_damage = 0

@export var BULLET_SPEED = 600.0

var DAMAGE = Global.damage_holder

func _ready() -> void: 
	player_damage = player.DAMAGE
	print("EU sou a bala e estou obtendo o dano do player: ", player, " e o seu dano é ", player_damage, ". MEU DANO É ", DAMAGE)

## Processa a direção e movimento da bala
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += BULLET_SPEED * delta * direction
	


## Quando a bala sai de cena, ela é excluida
func _on_bullet_screen_notifier_screen_exited():
	queue_free()


## Hit da bala

	#if area.has_method("break_sprite"):
		#if area.hp < 0:
			#area.break_sprite()
			#print("Fim")
		#else:
			#area.animation_player.play("hit")
			#area.create_resource() #chamando nossa função para surgimento do recurso

