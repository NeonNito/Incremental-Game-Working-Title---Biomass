class_name buildCont
extends Node

static var ref : buildCont
func _init() -> void:
	if not ref : ref = self
	else: queue_free()
	

signal buildingUpdated
signal buildingCreated(building, qty)
signal buildingRemoved(building, qty)

func _ready() -> void:
	buildExtractor.ref.buildingCreated.connect(extractorProdTotal)
	pass
	
var buildingsTotal: Dictionary = {
}

func getBuildingTotal(building) -> int:
	var total = buildingsTotal.get(building)
	return total

func updateBuilding(building, qty):
	if buildingsTotal.has(building):
		buildingsTotal[building] += qty
	else: buildingsTotal[building] = qty
	
	#signals
	if qty >= 0:
		buildingCreated.emit(building, qty)
		print("%s %s created" %building %qty)
		
	else: 
		buildingRemoved.emit(building, qty)
		print(str(building) + " " + str(qty) + " removed")
	#Erase empty keys
	if buildingsTotal[building] <= 0:
		buildingsTotal.erase(building)
	
#////// Buildings Prod/Costs

var ExtractorProdTotal: float = 0
func extractorProdTotal():
	ExtractorProdTotal = buildExtractor.ref.biomassProd
	prodCont.ref.updateProduction("biomassProd", [ExtractorProdTotal,0])
