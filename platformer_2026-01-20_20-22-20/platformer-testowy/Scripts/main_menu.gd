extends Control

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_opcje_pressed() -> void:
	print("Kiedyś będą opcje")

func _on_wyjdź_pressed() -> void:
	get_tree().quit()

func _on_twórcy_gry_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
