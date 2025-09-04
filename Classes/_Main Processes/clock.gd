class_name Clock
extends Node

static var ref : Clock
func _init() -> void:
	if not ref : ref = self
	else: queue_free()

signal ticked

var _tickDuration:float = 1.0
var _tickProgression:float = 0.0

func _process(delta: float) -> void:
	_tickProgression += delta
	
	if _tickProgression >= _tickDuration:
		tick()
		
func tick():
	_tickProgression -= _tickDuration
	ticked.emit()
