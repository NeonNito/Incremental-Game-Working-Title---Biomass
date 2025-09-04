extends Node
class_name HiveSpaceManager

static var ref : HiveSpaceManager
func _init() -> void:
	if not ref : ref = self
	else: queue_free()

var _hiveSize : int = 0
var _hiveSizeMax : int = 20

signal HiveSizeUpdated
signal HiveSizeCreated(quantitiy : int)
signal HiveSizeMaxCreated(quantitiy : int)

func getCurrentHiveSize():
	return _hiveSize

func getTotalHiveSize():
	return _hiveSizeMax

func expandHive(quantity : float):
	if quantity <= 0: return
	_hiveSizeMax += quantity
	HiveSizeCreated.emit()

func sizeCheck(quantity) -> bool:
	if quantity+_hiveSize  >  _hiveSizeMax: return false
	return true
	
func useSpace(quantity : int):
	if quantity < 0: return
	if quantity+_hiveSize  >  _hiveSizeMax: return
	_hiveSize += quantity
	
	
