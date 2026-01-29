extends Node2D

func _on_antygravity_area_2d_body_entered(_body: CharacterBody2D) -> void:
	Events.gravity_up.emit()
func _on_antygravity_area_2d_body_exited(body: CharacterBody2D) -> void:
	Events.gravity_down.emit()
