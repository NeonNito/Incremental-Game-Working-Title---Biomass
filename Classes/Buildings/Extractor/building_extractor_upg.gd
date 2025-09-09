class_name buildExtUpg
extends Node

static var ref : buildExtUpg
func _init() -> void:
	if not ref : ref = self
	else: queue_free()

var costMult:int = 1.1
var producesMult:int = 1
var prodCostMult:int = 1
var sizeMult:int = 1

signal upgradePurchased(upgrade)

var extractorUpgrade1_Des: String = "By fusing the embryo of 2 extractors together, and utilizing a surplus of biomass, we can sythesize a new genome that has double the outbut of a base extractor"
var extractorUpgrade1: Dictionary = {
	"cost": ["biomass", 200],
	"purchased": false,
	"desc": extractorUpgrade1_Des,
	"producesMult": 2,
	}

func purchaseUpgrade(upgrade):
	var cost = upgrade["cost"][1]
	if biomassCont.ref.canSpendBiomass(cost) == false: return
	
	upgrade["purchased"] = true
	
	if upgrade.has("costMult"):
		costMult += upgrade["costMult"][1]
	
	if upgrade.has("producesMult"):
		producesMult += upgrade["producesMult"][1]
		
	if upgrade.has("prodCostMult"):
		prodCostMult += upgrade["prodCostMult"][1]
		
	if upgrade.has("sizeMult"):
		if sizeMult == 1:
			sizeMult = upgrade["sizeMult"][1]
		else: sizeMult = upgrade["sizeMult"][1]
	upgradePurchased.emit(upgrade)
