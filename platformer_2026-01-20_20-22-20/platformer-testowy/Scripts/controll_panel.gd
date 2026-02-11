extends Node2D

@export var ControlPannelNumber = 0
@onready var animated_sprite = $ControlPanelAnimatedSprite
@onready var button_press = $ButtonAudio
@onready var turnOff_audio = $TurnOff
var status: bool = true

func _on_control_panel_area_2d_body_entered(_body: CharacterBody2D) -> void:
	if not status: return
	button_press.play()
	turnOff_audio.play()
	Events.deactivate_laser.emit(ControlPannelNumber)
	animated_sprite.play("Deactivate")
	status = false
