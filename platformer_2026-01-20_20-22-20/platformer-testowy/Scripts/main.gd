extends Node2D

var Lvl1 = preload("res://Scenes/Levels/level_template.tscn")
var Lvl2 = preload("res://Scenes/Levels/level_template_2.tscn")
var Lvl3 = preload("res://Scenes/Levels/level_template_3.tscn")
var Lvl4 = preload("res://Scenes/Levels/level_template_4.tscn")
var Lvl5 = preload("res://Scenes/Levels/level_template_5.tscn")
var instance1 = Lvl1.instantiate()
var instance2 = Lvl2.instantiate()
var instance3 = Lvl3.instantiate()
var instance4 = Lvl4.instantiate()
var instance5 = Lvl5.instantiate()
var SpawnRight = Vector2(768, 0)
var SpawnDown = Vector2(0, 432)
var SpawnLeft = Vector2(-768, 0)
var SpawnUp = Vector2(0, -432)
var BottomLeftEntranceRooms = [instance3, instance3]
var TopLeftEntraneRooms = [instance4]
var TopNorthEntranceRooms = [instance5]

func _ready() -> void:
	
	add_child(instance1)
	var SecondRoom = BottomLeftEntranceRooms[randi()% BottomLeftEntranceRooms.size()]
	add_child(SecondRoom)
	BottomLeftEntranceRooms.erase(SecondRoom)
	SecondRoom.global_position = instance1.global_position + SpawnRight
	var ThirdRoom = TopLeftEntraneRooms[randi()% TopLeftEntraneRooms.size()]
	add_child(ThirdRoom)
	TopLeftEntraneRooms.erase(ThirdRoom)
	ThirdRoom.global_position = SecondRoom.global_position + SpawnRight
	var ForthRoom = TopNorthEntranceRooms[randi()% TopNorthEntranceRooms.size()]
	add_child(ForthRoom)
	TopNorthEntranceRooms.erase(ForthRoom)
	ForthRoom.global_position = ThirdRoom.global_position + SpawnUp
	
func _process(_delta: float) -> void:
	pass
