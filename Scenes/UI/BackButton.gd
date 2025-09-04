extends Button

@onready var buildings: GridContainer = $"../../Buildings"
@onready var main_menu: GridContainer = $"../../Main Menu"
@onready var build_confirm_menu: VBoxContainer = $"../../../../BuildConfirmMenu"

func _on_pressed() -> void:
		buildings.hide()
		main_menu.show()
		build_confirm_menu.hide()
		SelectedBuilding.ref.reset()
