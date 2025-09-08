class_name buildUpgCont
extends Node

static var ref : buildUpgCont
func _init() -> void:
	if not ref : ref = self
	else: queue_free()
	
var buildExtractorMod: Dictionary = {
	"cost": ["biomass", 0.5],
	"produces": ["biomass", 2],
	"prodCost": [1,1],
	"size": 1,
	"prodcutionTime": 1,
}

func _ready() -> void:
	var test = getModStats(buildExtractor, buildExtractorMod)
	print(test)
	

func getModStats(building, buildingMod) -> Dictionary:
	var stats: Dictionary = building.ref.getStats()
	
	if stats.has("cost"):
		stats["cost"][1] *= buildingMod["cost"][1]
		print("Cost mod suceeded")
	else: print("cost mod failed")
	
	if stats.has("produces"):
		stats["produces"][1] *= buildingMod["produces"][1]
		print("produces mod suceeded")
	else: print("produces mod failed")
	
	if stats.has("prodCost"):
		stats["prodCost"][1] *= buildingMod["prodCost"][1]
		
	if stats.has("size"):
		stats["size"] *= buildingMod["size"]
		
	if stats.has("prodcutionTime"):
		stats["prodcutionTime"] *= buildingMod["prodcutionTime"]
		
	return stats
