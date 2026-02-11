extends Sprite2D

func _on_area_2d_body_entered(_body: Node2D) -> void:
	Global_script.checkpoint_pos = $Marker2D.global_position
	Global_script.previous_checkpoint_node = self
