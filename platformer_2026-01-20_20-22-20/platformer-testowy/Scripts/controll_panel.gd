extends Node2D

@onready var animated_sprite = $ControlPanelAnimatedSprite
var status: bool = true

func _on_control_panel_area_2d_body_entered(_body: CharacterBody2D) -> void:
	if not status: return
	Events.deactivate_laser.emit()
	animated_sprite.play("Deactivate")
	status = false
