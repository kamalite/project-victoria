extends Node2D

@export var DoorNumber = 0
@onready var animated_sprite = $LaserDoorAnimatedSprite
var status: bool = true
var ControlPannelNumber

func _ready() -> void:
	Events.deactivate_laser.connect(func turnOffDoor(ControlPannelNumber):
		if DoorNumber == ControlPannelNumber:
			status = false
			animated_sprite.play("Deactivate")
	)

func _on_area_2d_body_entered(_body: CharacterBody2D) -> void:
	if not status: return
	Events.laser.emit()
