class_name biomassCont
extends Node

static var ref : biomassCont
func _init() -> void:
	if not ref : ref = self
	else: queue_free()

signal biomass_created
signal biomass_updated(QTY:int)
signal biomass_spent(QTY:int)
signal biomass_maxed

func getBiomass() -> Array:
	return resourceCont.ref.getResource("biomass")
	
func addBiomass(amount : float):
	#if amount <= 0: return
	var biomass = getBiomass()
	
	if biomass[0] >= biomass[1]: 
		biomass_maxed.emit()
		return
	
	var biomassOld = biomass[0]
	biomass.set(0,biomassOld + amount)
	biomass[0] = clamp(biomass[0], 0, biomass[1])
	print (str(biomass) + " to be Added")
	
	resourceCont.ref.bank[biomass] = biomass

	resourceCont.ref.resource_updated.emit()
	biomass_created.emit(amount)
	biomass_updated.emit()
	
func canSpendBiomass(quantity : int) -> bool:
	if quantity < 0: 
		print("invalid cost!")
		return false
		
	if quantity > resourceCont.ref.bank["biomass"][1]: 
		print("Not Enough Biomass!")
		return false
	
	return true
	
func spendBiomass(amount : int):
	var biomass = getBiomass()
	if amount <= 0: 
		print("invalid cost!")
		return
	if amount > biomass[0]: 
		print("Not Enough Biomass!")
		return 
	
	var biomassOld = biomass[0]
	biomass.set(0,biomassOld - amount)
	biomass[0] = clamp(biomass[0], 0, biomass[1])
	print (str(biomass) + " to be subtracted")
	
	resourceCont.ref.bank[biomass] = biomass
	
	resourceCont.ref.resource_updated.emit()
	biomass_spent.emit(amount)
	biomass_updated.emit()
	return true 
