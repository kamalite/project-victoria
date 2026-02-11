extends Node2D

var Lvl1 = preload("res://Scenes/Levels/level_template_2.tscn")
var Lvl2 = preload("res://Scenes/Levels/level_template_2.tscn")
var Lvl3 = preload("res://Scenes/Levels/level_template_3.tscn")
var Lvl4 = preload("res://Scenes/Levels/level_template_4.tscn")
var Lvl5 = preload("res://Scenes/Levels/level_template_5.tscn")
var Lvl6 = preload("res://Scenes/Levels/level_template_6.tscn")
var Lvl7 = preload("res://Scenes/Levels/level_template_7.tscn")
var instance1 = Lvl1.instantiate()
var instance2 = Lvl2.instantiate()
var instance3 = Lvl3.instantiate()
var instance4 = Lvl4.instantiate()
var instance5 = Lvl5.instantiate()
var instance6 = Lvl6.instantiate()
var instance7 = Lvl7.instantiate()
var SpawnRight = Vector2(768, 0)
var SpawnDown = Vector2(0, 432)
var SpawnLeft = Vector2(-768, 0)
var SpawnUp = Vector2(0, -432)

func _ready() -> void:
	
	add_child(instance1)
	var SecondRoom = instance3
	add_child(SecondRoom)
	SecondRoom.global_position = instance1.global_position + SpawnRight
	var ThirdRoom = instance4
	add_child(ThirdRoom)
	ThirdRoom.global_position = SecondRoom.global_position + SpawnRight
	var FourthRoom = instance5
	add_child(FourthRoom)
	FourthRoom.global_position = ThirdRoom.global_position + SpawnUp
	var FifthRoom = instance6
	add_child(FifthRoom)
	FifthRoom.global_position = FourthRoom.global_position + SpawnLeft
	var SixthRoom = instance7
	add_child(SixthRoom)
	SixthRoom.global_position = FifthRoom.global_position + SpawnUp
	var SeventhRoom = instance2
	add_child(SeventhRoom)
	SeventhRoom.global_position = SixthRoom.global_position + SpawnRight
func _process(_delta: float) -> void:
	pass
