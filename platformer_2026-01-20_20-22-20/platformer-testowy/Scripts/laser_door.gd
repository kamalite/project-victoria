extends Node2D

func _on_area_2d_body_entered(_body: CharacterBody2D) -> void:
	Events.laser.emit()
