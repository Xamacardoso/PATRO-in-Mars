extends StaticBody2D

# Aqui irei configurar algumas informações iniciais sobre a jazida.A ideia é fazer uma jazida que quebre no momento que
# a bala(que é uma cena) e a cena da jazida se encontrarem,diminuindo o hp da jazida até o 0 e gerando automaticamente um recurso aleatoriamente escolhido entre 4 recursos,além
# fazendo ele aparecer na posição onde a jazida se encontrava.

var jazida = preload("res://scenes/resource_box.tscn") # Cena da jazida,que irá encontrar a da bala
@export var hp = 50 # Vida para jazida

func _ready():
	$DespawnTimer.start()

var dictionary = {
	"iron": preload("res://scenes/iron_resource.tscn"),
	"copper": preload("res://scenes/copper_resource.tscn"),
	"bronze": preload("res://scenes/bronze_resource.tscn"),
	"granite": preload("res://scenes/granite_resource.tscn"),
}

var recursos_pra_cena: Array = dictionary.values() # Criando um arreio de dicionário para posteriormente fazer o random disso.



func _on_hurt_box_hurt(DAMAGE):
	hp -= DAMAGE
	if hp <= 0:
		# Escolhendo um recurso para aparecer em meio a esse cenário
		var escolhendo_recurso = randi() % recursos_pra_cena.size()
		# Acessando o recurso escolhido
		var acessando_recurso = recursos_pra_cena[escolhendo_recurso]
	
		# Agora,tentarei criar o recurso para aparecer na cena
		var recurso_instancia = acessando_recurso.instantiate()
		# Tentarei colocar o recurso criado no local onde a jazida estava
		recurso_instancia.global_position = self.global_position
		self.queue_free() #hp chega em zero e a cena da jazida é retirada do world.
		# Adicionando o recurso na cena
		get_tree().get_first_node_in_group("Pickups").add_child(recurso_instancia)



func _on_despawn_timer_timeout():
	queue_free()
