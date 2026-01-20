extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ProjectSettings.set_setting("physics/2d/default_gravity_vector", Vector2(0, 1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: CharacterBody2D) -> void:
	ProjectSettings.set_setting("physics/2d/default_gravity_vector", Vector2(0, -1))
	print("gravityUP")
