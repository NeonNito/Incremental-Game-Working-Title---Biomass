class_name sizeCont
extends Node

static var ref : sizeCont
func _init() -> void:
	if not ref : ref = self
	else: queue_free()

var hiveSize: Array = [0, 20]

signal sizeUpdate

func getHiveSize() -> Array:
	return hiveSize
	
func enoughSpace(amount) -> bool:
	if hiveSize[0] + amount > hiveSize[1]: 
		return false
	else: return true
	
func spendSize(amount):
	if hiveSize[0] + amount > hiveSize[1]: 
		print("Not Enough Space!")
		return
	hiveSize[0] += amount
	sizeUpdate.emit()

func increaseMaxSize(amount):
	hiveSize[1] += amount
	sizeUpdate.emit()
