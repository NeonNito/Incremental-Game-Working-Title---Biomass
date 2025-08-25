extends Button
@onready var button_template: Button = $"."

@export var buttonName: = ""
@export var dictName: = ""
@export var biomassCost:int = 0
@export var supplyCost:int = 0
@export var providesProduction:float = 0
@export var providesSupply = 0
@export var providesStorage = 0

var _active = false

func _on_mouse_entered() -> void:
	_active = true
func _on_mouse_exited() -> void:
	_active = false

func _process(_delta):
	var color = modulate
	if supplyCost >= 0:
		if _active:
			button_template.text = str(buttonName) + "\n " + "Cost: " + str(biomassCost) + " Supply: " + str(supplyCost)
		else:
			button_template.text = str(buttonName)
			
	if supplyCost == 0 and providesStorage == 0:
		if _active:
			button_template.text = str(buttonName) + "\n " + "Cost: " + str(biomassCost) + " Gives Supply: " + str(providesSupply)
		else:
			button_template.text = str(buttonName)

	if supplyCost == 0 and providesSupply == 0:
		if _active:
			button_template.text = str(buttonName) + "\n " + "Cost: " + str(biomassCost) + " Gives Storage: " + str(providesStorage)
		else:
			button_template.text = str(buttonName)
			
	modulate = color

func Add_item_Dict(Item, amount):
	if Item in GB.buildings_list_DICT:
		GB.buildings_list_DICT[Item] += amount
	else:
		GB.buildings_list_DICT[Item] = amount

func IncreaseProd(amount):
	GB.ProdTotal += amount 

func _buttonPressed() -> void:
	if supplyCost + GB.SupplyTotal <= GB.SupplyMax:
		Create()
func Create():
	if GB.Biomass >= biomassCost:
		GB.Biomass -= biomassCost
		IncreaseProd(providesProduction)
		Add_item_Dict(str(dictName), 1)
		GB.SupplyTotal += supplyCost
		GB.SupplyMax += providesSupply
		GB.BiomassMAX += providesStorage
