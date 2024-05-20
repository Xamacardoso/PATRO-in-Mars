extends Area2D

# Aqui irei configurar algumas informações iniciais sobre a jazida.A ideia é fazer uma jazida que quebre no momento que
# a bala(que é uma cena) e a cena da jazida se encontrarem,diminuindo o hp da jazida até o 0 e gerando automaticamente um recurso aleatoriamente escolhido entre 4 recursos,além
# fazendo ele aparecer na posição onde a jazida se encontrava.

var jazida = preload("res://scenes/jazida.tscn") as PackedScene # Cena da jazida,que irá encontrar a da bala
@onready var bala = preload("res://scenes/bullet.tscn") as PackedScene #Indicando a cena da bala também
var hp = 100 # Vida para jazida
	
var dictionary = {
	"iron": preload("res://scenes/iron_resource.tscn"),
	"copper": preload("res://scenes/copper_resource.tscn"),
	"bronze": preload("res://scenes/bronze_resource.tscn"),
	"granite": preload("res://scenes/granite_resource.tscn")
}

var recursos_pra_cena: Array = dictionary.values() # Criando um arreio de dicionário para posteriormente fazer o random disso.

# Aqui irei criar uma função que faça a jazida perder vida quando sua cena se encontra com a da bala e,consequentemente,chamar um recurso
func _on_area_shape_entered(body) -> void:
	if body == bala:
		hp -= 50 #Se o corpo que entrar na área for o do bala,hp da jazida diminui
		if hp <= 0:
			self.queue_free() #hp chega em zero e a cena da jazida é retirada do world.
		
		
	# Escolhendo um recurso para aparecer em meio a esse cenário
		var escolhendo_recurso = randi() % recursos_pra_cena.size()
	# Acessando o recurso escolhido
		var acessando_recurso = recursos_pra_cena[escolhendo_recurso]
	
# Agora,tentarei criar o recurso para aparecer na cena
		var recurso_instancia = acessando_recurso.instance()
# Tentarei colocar o recurso criado no local onde a jazida estava
		recurso_instancia.translation = jazida.translation
# Adicionando o recurso na cena
		get_parent().add_child(recurso_instancia)
		_on_area_shape_entered(bala)
