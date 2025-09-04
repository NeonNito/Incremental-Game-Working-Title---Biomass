extends RichTextLabel

@onready var buildings: RichTextLabel = $"."

func _process(delta: float) -> void:
		display_buildings()

func display_buildings():
	buildings.text = ""
	if Building_ExtractorManager.ref._numberBuilt > 0:
		buildings.text += "Extractors: %s \n" %Building_ExtractorManager.ref._numberBuilt
