extends Control

@onready var VictoryAudio = $AudioStreamPlayer

func _ready() -> void:
	VictoryAudio.play()

func _process(delta: float) -> void:
	pass

func _on_wyjdź_pressed() -> void:
	get_tree().quit()

func _on_twórcy_gry_pressed() -> void:
	pass # Replace with function body.
