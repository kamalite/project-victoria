extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite = $AnimatedSprite2D
var can_control: bool = true

func _ready() -> void:
	Events.gravity_up.connect(rotate_character_up)
	Events.gravity_down.connect(rotate_character_down)
	Events.laser.connect(death)

func _physics_process(delta: float) -> void:
	if not can_control: return
	
	velocity += get_gravity() * delta
	
	if Input.is_action_just_released("ui_up") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY / 4
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("ui_up") and is_on_ceiling():
		velocity.y = -JUMP_VELOCITY
		
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("Idle")

	move_and_slide()
	
func death() -> void:
	can_control = false
	animated_sprite.play("Death")
	await get_tree().create_timer(1).timeout
	reset_player()
	
func reset_player() -> void:
	global_position = Vector2(60, 370)
	can_control = true
	animated_sprite.play("Idle")
	
func rotate_character_up() -> void:
	rotation_degrees = 180
	
func rotate_character_down() -> void:
	rotation_degrees = 0
