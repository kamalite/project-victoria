extends Node2D

var Lvl1 = preload("res://Scenes/Levels/level_template.tscn")
var Lvl2 = preload("res://Scenes/Levels/level_template_2.tscn")
var Lvl3 = preload("res://Scenes/Levels/level_template_3.tscn")
var Lvl4 = preload("res://Scenes/Levels/level_template_4.tscn")
var instance1 = Lvl1.instantiate()
var instance2 = Lvl2.instantiate()
var instance3 = Lvl3.instantiate()
var instance4 = Lvl4.instantiate()
var SpawnRight = Vector2(768, 0)
var SpawnDown = Vector2(0, 432)
var SpawnLeft = Vector2(-768, 0)

func _ready() -> void:
	
	add_child(instance1)
	add_child(instance2)
	instance2.global_position = instance1.global_position + SpawnRight
	add_child(instance4)
	instance4.global_position = instance2.global_position + SpawnDown
	add_child(instance3)
	instance3.global_position = instance4.global_position + SpawnLeft
	
func _process(delta: float) -> void:
	pass
