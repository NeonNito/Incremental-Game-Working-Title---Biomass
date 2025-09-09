extends TextureButton

func _ready() -> void:
	self.pressed.connect(_on_pressed)
	sizeCont.ref.sizeUpdate.connect(buttonState)
	biomassCont.ref.biomass_updated.connect(buttonState)
	buttonState()

func buttonState():
	if sizeCont.ref.enoughSpace(buildExtractor.ref.extractorDict["size"]) == false: 
		self.button.disabled = true
		return
	if biomassCont.ref.canSpendBiomass(buildExtractor.ref.currentCost):
		self.button.disabled = true
		return
	self.button.disabled
	pass

func _on_pressed():
	buildExtractor.ref.createExtractor(1)
	pass
