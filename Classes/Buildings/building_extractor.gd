class_name buildExtractor
extends Node

static var ref : buildExtractor
func _init() -> void:
	if not ref : ref = self
	else: queue_free()
	
var extractorDict: Dictionary = {
	"cost": ["biomass", 10],
	"produces": ["biomass", 0.1],
	"prodCost": [0,0],
	"size": 1,
	"prodcutionTime": 1,
}

#func getStats():
	#for totals in extractorDict
		#var
#
#func createExtractor(qty):
	#resourceCont.ref.

func updateExtractor(qty):
	buildCont.ref.updateBuilding("extractor", qty)

func updateCost(resource, qty):
	extractorDict["cost"] = [resource, qty]

func updateProd(resource, qty):
	extractorDict["produces"] = [resource, qty]

func updateProdCost(resource, qty):
	extractorDict["prodCost"] = [resource, qty]

func updateSize(qty):
	extractorDict["size"] = qty
