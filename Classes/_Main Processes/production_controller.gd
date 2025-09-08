class_name prodCont
extends Node

static var ref : prodCont
func _init() -> void:
	if not ref : ref = self
	else: queue_free()
	

var prodBank: Dictionary = {
	"biomassProd": [10,-2],
	"chitinProd": [1,0]
}

func _ready() -> void:
	Clock.ref.ticked.connect(productionRun)

func getRate(resource) -> float:
	var total: float = prodBank.get(resource)[0] + prodBank.get(resource)[1]
	return total
	
func updateProduction(resource, total: Array):
	prodBank.set(resource, total)

func tallyProd():
	pass
	#func updateProd(resource, amount):
	#var resourceMod = str(resource) + "Mod"
	#print(resourceMod)
	#buildUpgCont.ref.getModStats(resource,)
	#

#// Resource Generators //#

func productionRun():
	genBiomass()

func genBiomass():
	var biomassOld = biomassCont.ref.getBiomass()
	var prodTotal = prodBank.get("biomassProd")[0] + prodBank.get("biomassProd")[1]
	biomassCont.ref.addBiomass(prodTotal)
	
