extends Node
class_name Building_RefineryManager

static var ref : Building_RefineryManager
func _init() -> void:
	if not ref : ref = self
	else: queue_free()
	
var _biomassCostArray:Array = [60]
var _biomassCost:int
var _supplyCost:int 
var _sizeCost:int = 3
var _tickDuration:float = 1.0
var _productionBase: float = 1.0
var _productionModifier: float = 1
var _productionPerTick:float = _productionBase * _productionModifier
var _providesSupply:int
var _providesStorage:int
var _providesSize:int
var _numberBuilt:int = 0

@onready var _timer: Timer = $Timer
var started = false

func _process(delta: float) -> void:
	pass
	
func _ready() -> void:
	_timer.wait_time = _tickDuration
	_timer.timeout.connect(_on_timer_timeout)
	_biomassCost = _biomassCostArray.back()
	
func updateProduction():
	_productionPerTick = (_productionBase * _productionModifier) * _numberBuilt

func updateCost():
	var newCostAdder = float(_biomassCost*GB.buildCostMulti)
	_biomassCost + round(newCostAdder)
	_biomassCostArray.append(_biomassCost + round(newCostAdder))
	_biomassCost = _biomassCostArray.back()

func toggle():
	if started == !started:
		stop()
	else: start()

func start() -> void:
	if started == false:
		_timer.start()
		started = !started
func stop() -> void:
	if started == true:
		_timer.stop()
		started = !started
		
func _generateBiomass() -> void:
	BiomassManager.ref.createBiomass(_productionPerTick)
	
func _on_timer_timeout() -> void:
	_generateBiomass()
