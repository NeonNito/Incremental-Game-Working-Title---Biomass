class_name buildExtractor
extends Node

static var ref : buildExtractor
func _init() -> void:
	if not ref : ref = self
	else: queue_free()

signal buildingCreated(qty) 

var extractorDict: Dictionary = {
	"cost": ["biomass", 10],
	"produces": ["biomass", 0.1],
	"size": 1,
	"built":0
}

var currentCost = (extractorDict["cost"][1] * buildExtUpg.ref.costMult) * (1.20)**extractorDict["built"]
var biomassProd: float

func getProd() -> float:
	var protTotal = (extractorDict["produces"][1] * extractorDict["built"]) * (buildExtUpg.ref.producesMult)
	return protTotal
	
func createExtractor(qty):
	if biomassCont.ref.canSpendBiomass(currentCost) == false: return
	if sizeCont.ref.enoughSpace(extractorDict["size"]) == false: return
	biomassCont.ref.spendBiomass(currentCost)
	sizeCont.ref.spendSize(extractorDict["size"])
	buildCont.ref.updateBuilding("Extractor", qty)
	biomassProd = getProd()
	buildingCreated.emit(qty)
	print("%s Extrator Created" %qty)
	
func _ready() -> void:
	pass
	
