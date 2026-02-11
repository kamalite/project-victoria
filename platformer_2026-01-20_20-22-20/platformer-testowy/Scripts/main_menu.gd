extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_opcje_pressed() -> void:
	print("Kiedyś będą opcje")


func _on_wyjdź_pressed() -> void:
	queue_free()
