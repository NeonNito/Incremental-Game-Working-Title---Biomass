extends Button
@onready var build_1: Button = $"."

signal BuiltBuilding

func _ready() -> void:
	BiomassManager.ref.biomass_updated.connect(canSpend)
	SelectedBuilding.ref.SelectionUpdated.connect(canSpend)
	HiveSpaceManager.ref.HiveSizeUpdated.connect(canHold)
	
func canSpend():
	if BiomassManager.ref.canSpend((SelectedBuilding.ref._biomassCost) * SelectedBuilding.ref.qunatityToCreate)  == false:
		build_1.disabled = true
	else: build_1.disabled = false

func canHold():
	if HiveSpaceManager.ref.sizeCheck(SelectedBuilding.ref._sizeCost) == false:
		build_1.disabled = true
	else: build_1.disabled = false
	
func _on_pressed() -> void:
	create(SelectedBuilding.ref._selectedBuilding)
	
func create(ClassName):
	SelectedBuilding.ref.BuildBuilding(ClassName)
