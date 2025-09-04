extends RichTextLabel
@onready var biomass_total: RichTextLabel = $"."

func _process(delta: float) -> void:
	biomass_total.text = "Biomass: %s" %BiomassManager.ref.getBiomass()
	
