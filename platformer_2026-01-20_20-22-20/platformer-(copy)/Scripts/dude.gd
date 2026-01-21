extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	
	velocity += get_gravity() * delta
	
	if Input.is_action_just_released("ui_up") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY / 4
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("ui_up") and is_on_ceiling():
		velocity.y = -JUMP_VELOCITY
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _on_anty_gravity_area_body_entered(body: CharacterBody2D) -> void:
	rotation_degrees = 180

func _on_anty_gravity_area_body_exited(body: CharacterBody2D) -> void:
	rotation_degrees = 0
	
