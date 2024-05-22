extends StaticBody2D

@export var max_hp = 1500
var hp = max_hp

@onready var health_bar = $ShipHealthBar/Bar
@onready var health_bar_initial_size = health_bar.size.x

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hurt_box_hurt(DAMAGE):
	hp -= DAMAGE
	health_bar.size.x = health_bar_initial_size * hp / max_hp
	if hp <= 0:
		queue_free()
		Global.transition_to_scene("game_over")

# A ideia é criar um sistema que detecte a colisão do player com a nave e absorva todo o conteúdo do inventário do
# player ao acontecer essa colisão.Tentarei usar o inventário e deixar claro para o sistema que existem valores ali
#,ou seja,o sistema tem que perceber que os valores mudaram à medida que o jogador coleta mais recursos.

var max_recursos = 50 # Quantidade máxima de recursos que a nave pode armazenar
var recursos_no_inventario = preload("res://scenes/utils/inventory.tscn") # A cena do inventário atualiza os valores conforme coleta de recursos,então talvez esse valores possam ser transferidos para nave
var recursos_da_transferencia: Array = recursos_no_inventario.values() # Quando o inventário atualiza valores,esses valores são carregados aqui e vão ser transferidos para a nave no momento da colisão
var player_colisao = preload("res://scenes/player.tscn") as PackedScene # Carregando a cena do player para usar logo na função abaixo.
var recursos_na_nave = 0

func on_Ship_Body_Entered(Body: player_colisao) -> void:
	if body is PackedScene: 
		if recursos_na_nave >= max_recursos: #Ao detectar a cena pré-carregada do player em sua área, os recursos na nave,que são zero inicialmente, usarão os valores no inventário para se atualizarem
			recursos_na_nave == 50
		else:
			recursos_na_nave += recursos_da_transferencia #Há um limite para os recursos da nave serem atualizados.
		
