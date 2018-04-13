extends Node

var potions = []
var foods = []
var spells = []
var tilemap
var player
var characters = []

const HealthPotion = preload("res://Items//HealthPotion.tscn")
const CookedSteak = preload("res://Items//CookedSteak.tscn")
const FireSpell = preload("res://Items//FireSpell.tscn")

func _ready():
	var instance = HealthPotion.instance()
	instance._ready()
	addPotions([instance, instance, instance])
	var instance = CookedSteak.instance()
	instance._ready()
	addFoods([instance, instance])
	var instance = FireSpell.instance()
	instance._ready()
	addSpells([instance, instance])

func addPotions(new_potions):
	for potion in new_potions:
		potions.append(potion)

func addFoods(new_foods):
	for food in new_foods:
		foods.append(food)

func addSpells(new_spells):
	for spell in new_spells:
		spells.append(spell)

func charactersAtPos(pos):
	var collisions = []
	for i in range(characters.size()):
		var other_orig_pos = Vector2(characters[i].original_pos.x / 128, characters[i].original_pos.y / 128)
		var other_target_pos = Vector2(characters[i].target_pos.x / 128, characters[i].target_pos.y / 128)
		if (other_orig_pos.x == pos.x and other_orig_pos.y == pos.y) or (other_target_pos.x == pos.x and other_target_pos.y == pos.y):
			collisions.append(characters[i])
	print(collisions)
	return collisions

func closestEnemy():
	var closestIndex
	var minDistance = -1
	for i in range(0, characters.size()):
		if characters[i] != player:
			var distance = player.original_pos.distance_squared_to(characters[i])
			if minDistance == -1 || distance < minDistance:
				minDistance = distance
				closestIndex = i
	if minDistance > -1:
		return characters[closestIndex]
	else:
		return null

func walkable(x, y):
	print("In walkable in GameData.gd")
	return tilemap.walkable(x, y)
