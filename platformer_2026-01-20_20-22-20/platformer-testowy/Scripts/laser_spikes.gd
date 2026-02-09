extends Node2D

@export var SpikesNumber = 0
@onready var animated_sprite = $LaserSpikesAnimatedSprite
var status: bool = true
var ControlPannelNumber

func _ready() -> void:
	Events.deactivate_laser.connect(func turnOffSpikes(ControlPannelNumber):
		if SpikesNumber == ControlPannelNumber:
			status = false
			animated_sprite.play("Deactivate")
	)

func _on_laser_spikes_area_2d_body_entered(_body: CharacterBody2D) -> void:
	if not status: return
	Events.laser.emit()
