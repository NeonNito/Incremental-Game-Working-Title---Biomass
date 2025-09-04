class_name resourceCont
extends Node

static var ref : resourceCont
func _init() -> void:
	if not ref : ref = self
	else: queue_free()

signal resource_updated

var bank: Dictionary = {
	"biomass": [20.0, 100.0],
	"chitin": [0.0, 20.0],
	}

#func _ready() -> void:
	#Clock.ref.ticked.connect(updateTotal)

func getResouceTotals():
	var total: String
	for resourceName in bank:
		var amount = bank[resourceName]
		total += str(resourceName) + " " + str(amount) + "\n"
	return total
	
func getResource(type) -> Array:
	var amount = bank.get(type)
	return amount
	
