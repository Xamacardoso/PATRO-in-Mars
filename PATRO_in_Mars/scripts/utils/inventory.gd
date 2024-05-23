extends Control

@onready var player = get_tree().get_first_node_in_group("Player")
var battery_needs = ["blue_shard","hematite_element"]
var upgrade_needs = {"dark_shard":{"amount": 5},"copper_element":{"amount":3},"bronze_element":{"amount":3}}


@onready var can_craft_battery = false
@onready var can_upgrade = false
var crafting_recipes = ["battery","upgrade"]


# Upgrade Needs
@onready var upgrade1 = %UpgradeNeedLabel1
@onready var upgrade2 = %UpgradeNeedLabel2
@onready var upgrade3 = %UpgradeNeedLabel3

func update_upgrade_needs():
	upgrade1.text =  str(upgrade_needs["dark_shard"]["amount"])
	upgrade2.text =  str(upgrade_needs["copper_element"]["amount"])
	upgrade3.text =  str(upgrade_needs["bronze_element"]["amount"])
	

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	update_upgrade_needs()


func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		Global.can_pause = !Global.can_pause
		visible = !visible
		get_tree().paused = visible
		print("Inventario apareceu")
		if visible:
			for item in crafting_recipes:
				check_if_can_craft(item)


func check_if_can_craft(recipe):
	match recipe:
		"battery":
			can_craft_battery = true
			for bat_need in battery_needs:
				if player.resources[bat_need]["amount"] < 5:
					can_craft_battery = false
					break
					
		"upgrade":
			can_upgrade = true
			for upg_need in upgrade_needs:
				if player.resources[upg_need]["amount"] < upgrade_needs[upg_need]["amount"]:
					can_upgrade = false
					break


func _on_button_pressed():
	if can_craft_battery:
		player.consumables["battery"]["amount"] += 1
		for item in battery_needs:
			player.resources[item]["amount"] -= 5
		check_if_can_craft("battery")



func _on_upgrade_button_pressed():
	if can_upgrade:
		player.level_up()
		for item in upgrade_needs:
			player.resources[item]["amount"] -= upgrade_needs[item]["amount"]
			upgrade_needs[item]["amount"] = floori(upgrade_needs[item]["amount"] * 1.4)
		
		check_if_can_craft("upgrade")
		update_upgrade_needs()
