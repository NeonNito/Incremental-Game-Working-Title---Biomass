extends RichTextLabel
@onready var biomass_production: RichTextLabel = $"."

func _process(delta: float) -> void:
	update()
	
func update():
	if Building_ExtractorManager.ref.started == true:
		biomass_production.text = "Biomass per sec: \n %s" %Building_ExtractorManager.ref._productionPerTick
