extends Control

@onready var VictoryAudio = $AudioStreamPlayer

func _ready() -> void:
	VictoryAudio.play()

func _process(delta: float) -> void:
	pass

func _on_wyjdź_pressed() -> void:
	get_tree().quit()

func _on_twórcy_gry_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
