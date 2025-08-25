extends Control

@onready var buildings_list: RichTextLabel = $PanelContainer2/Panel/VBoxContainer/MarginContainer3/Buildings_List
@onready var prod_total: RichTextLabel = $PanelContainer2/Panel/VBoxContainer/MarginContainer4/PROD_TOTAL
@onready var capacity_bar: ProgressBar = $PanelContainer/VBoxContainer/Panel2/CAPACITY_BAR
@onready var bio_mass_total: RichTextLabel = $PanelContainer/VBoxContainer/Panel2/VBoxContainer/BioMassTotal
@onready var bms_btn: Button = $BMS_BTN
@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var v_box_container: VBoxContainer = $PanelContainer/VBoxContainer/Panel/MarginContainer/VBoxContainer

var buttonAdd = preload("res://button_template.tscn")
var instancebuttonAdd = buttonAdd.instantiate()

func _ready() -> void:
	buildings_list.text = str("")
func _process(delta: float) -> void:
	bio_mass_total.text = "Biomass: " + str(int(GB.Biomass)) + " / " + str(GB.BiomassMAX)
	prod_total.text = "Biomass Production: \n" + str(GB.ProdTotal) + " Per Second"
	capacity_bar.value = GB.Biomass
	rich_text_label.text = "Supply: " + str(GB.SupplyTotal) + " / " + str(GB.SupplyMax)
	capacity_bar.value = GB.Biomass
	capacity_bar.max_value = GB.BiomassMAX
	Check_Unlocks()
	Production((GB.ProdTotal * delta))
	display_buildings()

func CreateBiomass(amount):
	GB.Biomass += amount
	GB.Biomass = clamp(GB.Biomass, 0, GB.BiomassMAX)
func Production(amount):
	GB.Biomass += amount
	GB.Biomass = clamp(GB.Biomass, 0, GB.BiomassMAX)
func IncreaseProd(amount):
	GB.ProdTotal += amount 
	
		
func Add_item_Dict(Item, amount):
	if Item in GB.buildings_list_DICT:
		GB.buildings_list_DICT[Item] += amount
	else:
		GB.buildings_list_DICT[Item] = amount

var test:bool = false

func Check_Unlocks():
	if GB.SupplyTotal >= 10:
		var gross = 1
	for item_name in GB.buildings_list_DICT:
		if GB.buildings_list_DICT["Drones"] >= 5 and test == false:
			test = true
			
func display_buildings():
	buildings_list.text = str("")
	for item_name in GB.buildings_list_DICT:
		var item_count = GB.buildings_list_DICT[item_name]
		buildings_list.text += str(item_name) + ": " + str(item_count) + "\n"
		
func _on_bms_btn_pressed() -> void:
	CreateBiomass(GB.ClickAmount)

func _on_ovr_btn_pressed() -> void:
	if GB.Biomass >= GB.CostOVR:
		GB.Biomass -= GB.CostOVR
		GB.SupplyMax += 20

func _on_total_btn_pressed() -> void:
	if GB.Biomass >= GB.CostSTRG:
			GB.Biomass-= GB.CostSTRG
			GB.BiomassMAX += 100
