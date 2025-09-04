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
	updateBuilding("extractor", -1)
	pass
	
var buildingsTotal: Dictionary = {
	"extractor": 1
}
func getBuildingTotal(building) -> int:
	var total = buildingsTotal.get(building)
	return total

func updateBuilding(building, qty):
	if buildingsTotal.has(building):
		buildingsTotal[building] += qty
	else: buildingsTotal[building] = qty
	
	if qty >= 0:
		buildingCreated.emit(building, qty)
		print("%s %s created" %building %qty)
		
	else: 
		buildingRemoved.emit(building, qty)
		print(str(building) + " " + str(qty) + " removed")
		
	if buildingsTotal[building] <= 0:
		buildingsTotal.erase(building)
