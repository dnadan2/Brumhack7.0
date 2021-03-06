extends "EnvironmentBase.gd"

signal keyUsed(unlockGuid, unlockedObjectsName)

export(bool) var locked setget setLocked, getLocked
var UnlockGuid

func _ready():
	self.get_node("/root/Node2D").connectUnlockableEnvironment(self)

func setLocked(_locked):
	if typeof(_locked) == TYPE_BOOL:
		locked = _locked
		walkable = !locked
		if get_node("Locks") != null:
			get_node("Locks").set_hidden(!locked)

func keyUnlocked():
	GameData.RemoveKey(UnlockGuid)
	emit_signal("keyUsed", UnlockGuid, name)
	setLocked(false)

func getLocked():
	return locked

func setUnlockGuid(unlockGuid):
	UnlockGuid = unlockGuid