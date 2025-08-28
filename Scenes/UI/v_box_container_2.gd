extends VBoxContainer

var offScreen = Vector2(-0.474, -0.474)
var onScreen = Vector2(0,0)
var target = offScreen
var state = false


func _process(delta: float) -> void:
		anchor_top = lerp(anchor_top, target.x, 0.3)
		anchor_bottom = lerp(anchor_bottom, target.y, 0.3)


func _on_texture_button_pressed() -> void:
	if !state:
		target = onScreen
	else:
		target = offScreen
	state = !state
