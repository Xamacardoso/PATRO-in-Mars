extends CharacterBody2D

@export var SPEED = 20.0
@export var hp = 10.0
@export var DAMAGE = 100.0
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var sprite = $AnimatedSprite2D

# Drops
var drops = {
	"blue_shard" : preload("res://scenes/enemy_resource_1.tscn"),
	"dark_shard" : preload("res://scenes/enemy_resource_two.tscn"),
}

var drops_to_scene : Array = drops.values()



func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = SPEED*direction
	if velocity.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	move_and_slide()


func _on_hurt_box_hurt(DAMAGE):
	hp -= DAMAGE
	print("Tomei dano. Meu hp: ",hp)
	if hp <= 0:
		hp = 0
		# Escolhendo um recurso para aparecer em meio a esse cenário
		var drop_choice = randi() % drops_to_scene.size()
		# Acessando o recurso escolhido
		var resource_acess = drops_to_scene[drop_choice]
	
		# Agora,tentarei criar o recurso para aparecer na cena
		var resource_instance = resource_acess.instantiate()
		# Tentarei colocar o recurso criado no local onde a jazida estava
		resource_instance.global_position = self.global_position
		velocity = Vector2.ZERO
		#await sprite.animation_finished
		# Adicionando o recurso na cena
		get_tree().get_first_node_in_group("Pickups").add_child(resource_instance)
		self.queue_free()

