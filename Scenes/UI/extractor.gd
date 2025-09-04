extends Button

func _on_pressed() -> void:
	SelectedBuilding.ref.SetBuilding(Building_ExtractorManager)
