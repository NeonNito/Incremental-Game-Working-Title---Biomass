class_name prodCont
extends Node

static var ref : prodCont
func _init() -> void:
	if not ref : ref = self
	else: queue_free()
	

var prodBank: Dictionary = {
	"biomassProd": [0,0],
}

func _ready() -> void:
	Clock.ref.ticked.connect(productionRun)

func getRate(resource) -> float:
	var total: float = prodBank.get(resource)[0] + prodBank.get(resource)[1]
	return total
	
func updateProduction(resource, amount: Array):
	if prodBank.has(resource):
		prodBank[resource] += amount
	else: prodBank[resource] = amount
	
#// Resource Generators //#

func productionRun():
	genBiomass()

func genBiomass():
	var biomassOld = biomassCont.ref.getBiomass()
	var prodTotal = getRate("biomassProd")
	biomassCont.ref.addBiomass(prodTotal)
	
