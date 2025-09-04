extends TextureButton

@onready var texture_button_2: TextureButton = $"."

const HUD_EXPAND_VERT_REV = preload("res://Resources/UI/HudExpandVertREV.png")
const HUD_EXPAND_VERT_REV_HIT = preload("res://Resources/UI/HudExpandVertREV_HIT.png")

const HUD_EXPAND_VERT = preload("res://Resources/UI/HudExpandVert.png")
const HUD_EXPAND_VERT_HIT = preload("res://Resources/UI/HudExpandVert_HIT.png")

var state = false


func normal():
	texture_button_2.texture_normal = HUD_EXPAND_VERT
	texture_button_2.texture_pressed = HUD_EXPAND_VERT_HIT
func rev():
	texture_button_2.texture_normal = HUD_EXPAND_VERT_REV
	texture_button_2.texture_pressed = HUD_EXPAND_VERT_REV_HIT
#func _process(delta: float) -> void:

func _on_pressed() -> void:
	if !state:
		state = rev()
	else:
			normal()
	state = !state
