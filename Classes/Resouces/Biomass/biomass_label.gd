extends Label

func _ready() -> void:
	biomassCont.ref.biomass_updated.connect(set_value)
	
var skipValue := 1.0
var targetValue : float = biomassCont.ref.getBiomass()[0]
var oldValue: float

func set_value():
	targetValue = biomassCont.ref.getBiomass()[0]

func _process(delta:float):
	var currentValue :float= oldValue
	currentValue = min(currentValue + skipValue, targetValue)
	self.text = "Biomass: \n" + str(currentValue) + " / " + str(biomassCont.ref.getBiomass()[1])
	oldValue = currentValue
