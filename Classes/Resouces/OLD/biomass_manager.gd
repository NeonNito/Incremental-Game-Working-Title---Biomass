extends Node
class_name BiomassManager

static var ref : BiomassManager
func _init() -> void:
	if not ref : ref = self
	else: queue_free()

var _biomass : float = 101.0
var _biomassMax : int = 100.0

signal biomass_updated
signal biomass_created(quantitiy : int)
signal biomass_spent(quantitiy : int)

func _ready() -> void:
	biomass_updated.connect(truncBiomass)

func truncBiomass():
	_biomass = snapped(_biomass, 0.01)

func getBiomass():
	return _biomass

func createBiomass(quantity : float):
	if quantity <= 0: return
	if _biomass >= _biomassMax: return
	_biomass += quantity
	biomass_created.emit(quantity)
	biomass_updated.emit()
	
func canSpend(quantity : int) -> bool:
	if quantity < 0: return false
	if quantity > _biomass: return false
	return true
	
func spendBiomass(quantity : int):
	if quantity <= 0: return
	if quantity > _biomass: return 
	_biomass -= quantity 
	biomass_spent.emit(quantity)
	biomass_updated.emit()
	return true 
