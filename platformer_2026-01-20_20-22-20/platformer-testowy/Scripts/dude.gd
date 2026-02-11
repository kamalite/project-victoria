extends CharacterBody2D

@onready var animated_sprite = $PlayerAnimatedSprite
@onready var footsteps_player = $FootstepsAudio
@onready var jump_player = $JumpAudio
@onready var respawn_audio = $RespawnAudio
@onready var death_audio = $DeathAudio
@onready var CoyoteTime: Timer = $CoyoteTime

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
var can_control: bool = true
var coyote_time_activated: bool = false

func _ready() -> void:
	Events.gravity_up.connect(rotate_character_up)
	Events.gravity_down.connect(rotate_character_down)
	Events.laser.connect(death)
	
	if Global_script.checkpoint_pos != Vector2(-999,-999):
		global_position = Global_script.checkpoint_pos
		
func _physics_process(delta: float) -> void:
	if not can_control: return
	
	velocity += get_gravity() * delta
	
	if is_on_floor():
		if coyote_time_activated:
			coyote_time_activated = false
			CoyoteTime.stop()
	else:
		if !coyote_time_activated:
			CoyoteTime.start()
			coyote_time_activated = true
	
	if Input.is_action_just_released("ui_accept") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY / 4
	if Input.is_action_just_pressed("ui_accept") and (!CoyoteTime.is_stopped() or is_on_floor()):
		velocity.y = JUMP_VELOCITY
		CoyoteTime.stop()
		coyote_time_activated = true
		animated_sprite.play("Jump")
		jump_player.play()
	elif animated_sprite.animation == "Jump" and is_on_floor():
		animated_sprite.play("Idle")
	if Input.is_action_just_pressed("ui_accept") and is_on_ceiling():
		velocity.y = -JUMP_VELOCITY
		animated_sprite.play("Jump")
		jump_player.play()
	elif animated_sprite.animation == "Jump" and is_on_ceiling():
		animated_sprite.play("Idle")
		
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		if is_on_floor():
			animated_sprite.play("Run")
		else:
			animated_sprite.play("Jump")
	elif animated_sprite.animation == "Run":
		animated_sprite.play("Idle")
		
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction == -1:
		animated_sprite.flip_h = true
	if direction == 1:
		animated_sprite.flip_h = false
 
	move_and_slide()
	
	handle_footsteps_audio()
	
func handle_footsteps_audio():
	if is_on_floor():
		if velocity.length() > 0:
			if not footsteps_player.playing:
				footsteps_player.play()
		else:
			if footsteps_player.playing:
				footsteps_player.stop()
		
func death() -> void:
	can_control = false
	death_audio.play()
	animated_sprite.play("Death")
	await get_tree().create_timer(1).timeout
	reset_player()
	
func reset_player() -> void:
	global_position = Global_script.checkpoint_pos
	can_control = true
	animated_sprite.play("Idle")
	respawn_audio.play()
	
func rotate_character_up() -> void:
	rotation_degrees = 180
	
func rotate_character_down() -> void:
	rotation_degrees = 0
