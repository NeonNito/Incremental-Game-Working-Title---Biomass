extends NinePatchRect

var offScreen = Vector2(-0.2, -0.2)
var onScreen = Vector2(0.025,0.025)
var target = offScreen
var state = false

func _process(delta: float) -> void:
		anchor_left = lerp(anchor_left, target.x, 0.1)
		anchor_right = lerp(anchor_right, target.y, 0.1)
		
func _on_texture_button_2_pressed() -> void:
	if !state:
		target = onScreen
	else:
		target = offScreen
	state = !state
