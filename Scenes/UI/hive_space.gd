extends RichTextLabel
@onready var hive_space: RichTextLabel = $"."

func _process(delta: float) -> void:
	update()

func update():
	hive_space.text = "Hive space: %s" %HiveSpaceManager.ref._hiveSize + " / %s" %HiveSpaceManager.ref._hiveSizeMax
