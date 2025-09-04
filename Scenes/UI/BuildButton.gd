extends Button

var button
func _ready() -> void:
	get_parent() == button
	button.connect("pressed",Callable(self,"_on_Button_pressed").bind(button))
	
@export var dictName: = ""
@export var biomassCost:int = 0
@export var supplyCost:int = 0
@export var sizeCost:int = 0
@export var providesProduction:float = 0
@export var providesSupply = 0
@export var providesStorage = 0
@export var providesSize = 0

func _buttonPressed() -> void:
	
	GB.dictName = dictName
	GB.biomassCost = biomassCost
	GB.supplyCost = supplyCost
	GB.sizeCost = sizeCost
	GB.providesProduction = providesProduction
	GB.providesSupply = providesSupply
	GB.providesStorage = providesStorage
	GB.providesSize = providesSize
