extends Node2D
@export var PlayerRespawn : Node2D

func _on_player_detection_area_body_entered(_body: Node2D) -> void:
	Events.room_entered.emit(self)

func _on_win_area_body_entered(_body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/end_screen.tscn")
