extends Node2D

var Lvl1 = preload("res://Scenes/Levels/level_template.tscn")
var Lvl2 = preload("res://Scenes/Levels/level_template_2.tscn")
var instance = Lvl1.instantiate()
var instance2 = Lvl2.instantiate()

func _ready() -> void:
	pass
	add_child(instance)
	add_child(instance2)
	instance2.global_position = Vector2(768, 0)
	
func _process(delta: float) -> void:
	pass
