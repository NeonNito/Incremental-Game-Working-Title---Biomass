extends Button

@onready var buildings: GridContainer = $"../../Buildings"
@onready var main_menu: GridContainer = $".."
@onready var build_confirm_menu: VBoxContainer = $"../../../../BuildConfirmMenu"

func _on_pressed() -> void:
	main_menu.hide()
	buildings.show()
	build_confirm_menu.show()
