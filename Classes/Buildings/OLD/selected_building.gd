extends Node
class_name SelectedBuilding

static var ref : SelectedBuilding
func _init() -> void:
	if not ref : ref = self
	else: queue_free()

signal SelectionUpdated

func _ready() -> void:
	BiomassManager.ref.biomass_updated.connect(costChanged)

var _selectedBuilding
var _biomassCost:int = -1
var _supplyCost:int = -1
var _sizeCost:int = -1
var _providesSupply:int = -1
var _providesStorage:int = -1
var _providesSize:int = -1
var qunatityToCreate:int = 1

func costChanged(ClassName):
	SetBuilding(ClassName)

func updateQuantity(amount):
	qunatityToCreate = amount

func SetBuilding(ClassName):
	_biomassCost = ClassName.ref._biomassCost
	_supplyCost = ClassName.ref._supplyCost
	_sizeCost = ClassName.ref._sizeCost
	_providesSupply = ClassName.ref._providesSupply
	_providesStorage = ClassName.ref._providesStorage
	_providesSize = ClassName.ref._providesSize
	_selectedBuilding = ClassName.ref
	SelectionUpdated.emit()
	
func reset():
	_biomassCost = -1
	_supplyCost = -1
	_sizeCost = -1
	_providesSupply = -1
	_providesStorage = -1
	_providesSize = -1
	_selectedBuilding = -1
	SelectionUpdated.emit()
	
func BuildBuilding(ClassName):
	if HiveSpaceManager.ref.sizeCheck(_sizeCost * qunatityToCreate) == true:
		ClassName.ref._numberBuilt += (qunatityToCreate)
		BiomassManager.ref.spendBiomass((_biomassCost) * (qunatityToCreate))
		ClassName.ref.start()
		ClassName.ref.updateCost()
		ClassName.ref.updateProduction()
		HiveSpaceManager.ref.useSpace(_sizeCost * qunatityToCreate)
		SetBuilding(ClassName)
