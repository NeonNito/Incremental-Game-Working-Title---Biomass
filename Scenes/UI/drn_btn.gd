extends Button

@onready var drn_btn: Button = $"."
var _active = false

func _on_button_mouse_entered():
	_active = true

func _on_button_mouse_exited():
	_active = false

func _process(delta):
	var color = modulate
	if _active:
		drn_btn.text = "Morph Drones\n " + "Cost: " + str(10*GlobalScripts.CostMultiDRN)
	else:
		drn_btn.text = "Morph Drones"
	modulate = color
