extends RichTextLabel
@onready var build_1_costs: RichTextLabel = $"."


func _ready() -> void:
	SelectedBuilding.ref.SelectionUpdated.connect(_on_seclection_updated)
	BiomassManager.ref.biomass_updated.connect(_on_seclection_updated)
	

func _on_seclection_updated():
	displayCosts()

func displayCosts():
	build_1_costs.text = ""
	if SelectedBuilding.ref._biomassCost > 0:
		build_1_costs.text += "Biomass Cost: %s \n" %(SelectedBuilding.ref._biomassCost * SelectedBuilding.ref.qunatityToCreate)
	if SelectedBuilding.ref._supplyCost > 0:
		build_1_costs.text += "Supply Cost: %s \n" %(SelectedBuilding.ref._supplyCost * SelectedBuilding.ref.qunatityToCreate)
	if SelectedBuilding.ref._sizeCost > 0:
		build_1_costs.text += "Space Cost: %s \n" %(SelectedBuilding.ref._sizeCost * SelectedBuilding.ref.qunatityToCreate)
	pass
