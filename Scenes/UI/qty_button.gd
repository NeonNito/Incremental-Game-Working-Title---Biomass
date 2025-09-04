extends Button

@onready var qty_button: Button = $"."
const HUD_ICON_10 = preload("res://Resources/UI/HudIcon10.png")
const HUD_51_ICON = preload("res://Resources/UI/Hud51Icon.png")
const HUD_ICON_1 = preload("res://Resources/UI/HudIcon1.png")

var state:int = 1

func _ready() -> void:
	pressed.connect(_on_pressed)
	
func _on_pressed():
	cycleTextures()

func cycleTextures():
	if state == 1:
		qty_button.icon = HUD_51_ICON 
		state = 5
		return
	if state == 5:
		qty_button.icon = HUD_ICON_10 
		state = 10
		return
	if state == 10:
		qty_button.icon = HUD_ICON_1 
		state = 1
		return
