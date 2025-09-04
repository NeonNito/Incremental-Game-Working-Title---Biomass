extends Control

#func _ready() -> void:

	
func _process(delta: float) -> void:
	pass
#	Check_Unlocks()
	#Production((GB.ProdTotal * delta))


func Production(amount):
	GB.Biomass += amount
	GB.Biomass = clamp(GB.Biomass, 0, GB.BiomassMAX)

#
#func Check_Unlocks():
	#if GB.SupplyTotal >= 10:
		#var gross = 1
	#for item_name in GB.buildings_list_DICT:
		#if GB.buildings_list_DICT["Drones"] >= 5 and test == false:
			#test = true
