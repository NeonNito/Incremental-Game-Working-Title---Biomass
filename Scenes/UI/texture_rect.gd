extends TextureRect
#
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var biomass_button: Button = $BiomassButton

var state = false

func _ready() -> void:
	animation_player.play("mawIdle")
	biomass_button.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	
	var inst = load("res://Scenes/gpu_particles_2d.tscn").instantiate()
	animation_player.stop()
	animation_player.play("mawEat")
	add_child(inst)
	inst.position = Vector2(30,25)
	animation_player.queue("mawIdle")

func _on_texture_button_pressed() -> void:
	if !state:
		animation_player.play("mawOpen")
		await animation_player.animation_finished
		biomass_button.show()
		animation_player.queue("mawIdle")
	else:
		biomass_button.hide()
		animation_player.play("mawClose")
	state = !state
