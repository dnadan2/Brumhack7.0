class BasicSword extends "Weapon.gd":
	const texture = preload("res://assets/basic_sword.png")
	
	func _init():
		iconFilePath = "res://assets/basic_sword.png"
		name = "Basic Sword"
		damage = 3
		holdOffset = [Vector2(8.6666, 14), Vector2(24.6666, 12), Vector2(12, 14), Vector2(18.3333, 14)]

	func onUse():
		pass

class BasicShield extends "Weapon.gd":
	const texture = preload("res://assets/basic_shield.png")
	
	func _init():
		iconFilePath = "res://assets/basic_shield.png"
		name = "Basic Shield"
		damage = 1
		holdOffset = [Vector2(21.3333, 18), Vector2(10.6666, 15), Vector2(16, 16), Vector2(16, 14)]

	#todo, somehow needs to block damage or something
	func onUse():
		pass

class BasicSpear extends "Weapon.gd":
	const texture = preload("res://assets/basic_spear.png")
	
	func _init():
		iconFilePath = "res://assets/basic_spear.png"
		name = "Basic Spear"
		relativeAttackPositions = [Vector2(0, -1)]
		damage = 1
		holdOffset = [Vector2(9, 12), Vector2(23, 12), Vector2(12, 12), Vector2(18, 12)]
		onlyAttacksFirstEnemy = false
	
	func onUse():
		pass