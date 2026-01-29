extends Node2D

@onready var animated_sprite = $LaserDoorAnimatedSprite
var status: bool = true

func _ready() -> void:
	Events.deactivate_laser.connect(turnOff)

func _on_area_2d_body_entered(_body: CharacterBody2D) -> void:
	if not status: return
	Events.laser.emit()

func turnOff() -> void:
	status = false
	animated_sprite.play("Deactivate")
