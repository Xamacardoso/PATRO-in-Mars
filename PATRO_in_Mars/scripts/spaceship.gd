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
