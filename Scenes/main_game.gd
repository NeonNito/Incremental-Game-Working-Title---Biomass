extends Node2D


func _ready() -> void:
	biomassCont.ref.biomass_created.connect(biomassEmitTest)
	biomassCont.ref.biomass_maxed.connect(maxedEmitTest)
	Clock.ref.ticked.connect(clockTest)
	print(biomassCont.ref.getBiomass())
	
func maxedEmitTest():
	print("Biomass Maxed out!")

func biomassEmitTest(quantity):
	print("%s Biomass Created!" %quantity)
	print ("Total biomass %s" %biomassCont.ref.getBiomass()[0])

func clockTest():
	
	pass
	
