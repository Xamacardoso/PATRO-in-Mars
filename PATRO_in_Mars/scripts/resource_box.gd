extends StaticBody2D

# Aqui irei configurar algumas informações iniciais sobre a jazida.A ideia é fazer uma jazida que quebre no momento que
# a bala(que é uma cena) e a cena da jazida se encontrarem,diminuindo o hp da jazida até o 0 e gerando automaticamente um recurso aleatoriamente escolhido entre 4 recursos,além
# fazendo ele aparecer na posição onde a jazida se encontrava.

var jazida = preload("res://scenes/resource_box.tscn") # Cena da jazida,que irá encontrar a da bala
@export var hp = 50 # Vida para jazida

func _ready():
	$DespawnTimer.start()
	randomize()



var drops = {
	35 :{
		"granite": preload("res://scenes/granite_resource.tscn"),
	},
	58 :{
		"copper": preload("res://scenes/copper_resource.tscn"),
	},
	79 :{
		"bronze": preload("res://scenes/bronze_resource.tscn"),
	},
	100 :{
		"iron": preload("res://scenes/iron_resource.tscn"),
	},
}

var recursos_pra_cena: Array = drops.keys() # Criando um arreio de dicionário para posteriormente fazer o random disso.


func roll_loot():
	var chance_roll = randi() % 101
	for rate in drops.keys():
		if chance_roll <= rate:
			return rate


func _on_hurt_box_hurt(DAMAGE):
	hp -= DAMAGE
	if hp <= 0:
		# Acessando o recurso escolhido
		var acessando_recurso = roll_loot()
	
		# Agora,tentarei criar o recurso para aparecer na cena
		var recurso_instancia = drops.get(acessando_recurso).values()[0].instantiate()
		# Tentarei colocar o recurso criado no local onde a jazida estava
		recurso_instancia.global_position = self.global_position
		self.queue_free() #hp chega em zero e a cena da jazida é retirada do world.
		# Adicionando o recurso na cena
		get_tree().get_first_node_in_group("Pickups").add_child(recurso_instancia)


func _on_despawn_timer_timeout():
	queue_free()
