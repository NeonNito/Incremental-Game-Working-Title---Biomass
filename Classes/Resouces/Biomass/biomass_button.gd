extends Button

func _ready() -> void:
	pressed.connect(_on_pressed)

func _process(delta: float) -> void:
	pass
var subtract = false
			
func _on_pressed():
	if subtract == true:
		biomassCont.ref.spendBiomass(1)
	else: biomassCont.ref.addBiomass(5)
