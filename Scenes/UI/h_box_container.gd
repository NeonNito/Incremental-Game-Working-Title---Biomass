extends HBoxContainer

var offScreen = Vector2(1.156, 1.156)
var onScreen = Vector2(1,1)
var target = offScreen
var state = false


func _process(delta: float) -> void:
		anchor_left = lerp(anchor_left, target.x, 0.3)
		anchor_right = lerp(anchor_right, target.y, 0.3)


func _on_texture_button_pressed() -> void:
	if !state:
		target = onScreen
	else:
		target = offScreen
	state = !state
