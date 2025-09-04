extends RichTextLabel
@onready var build_display: RichTextLabel = $"."


func _pocess(delta: float) -> void:
		build_display.text = GB.hudDisplay
