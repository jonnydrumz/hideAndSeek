extends KinematicBody2D

export(Array,Texture) var player_textures : Array

export(float) var player_speed : float = 64.0
export(float) var animation_speed : float = 2.0
export(float) var player_life : float = 5.0

onready var sprite    : Sprite  = $Sprite
onready var candle    : Light2D = $Candle
onready var lamplight : Light2D = $LampLight

onready var animator  : AnimationPlayer = $AnimationPlayer
onready var walk_sfx  : AudioStreamPlayer = $AudioStreamPlayer

onready var velocity : Vector2 = Vector2.ZERO
onready var angle    : float   = .0
onready var player_speed_y : float = player_speed * .5

func _physics_process(delta : float):
	if player_life < 1.0:
		die()
	_move(delta)
	_action(delta)
	_animate(delta)
	if velocity.length() > .1:
		angle = velocity.angle()
	if lamplight.running:
		lamplight.rotation = angle
		
	velocity = move_and_slide(velocity, Vector2.UP, false, 4.0)

func _move(delta : float):
	var leftv = -1 if Input.is_action_pressed("ui_left") else .0
	var rightv = 1 if Input.is_action_pressed("ui_right") else .0
	var upv = -1 if Input.is_action_pressed("ui_up") else .0
	var downv = 1 if Input.is_action_pressed("ui_down") else .0
	velocity.x = leftv + rightv
	velocity.y = upv + downv
	velocity = velocity.normalized()
	velocity.x *= player_speed
	velocity.y *= player_speed_y
	if velocity.length() > .1:
		sprite.update_texture(player_textures, velocity.angle())

func _action(delta : float):
	if Input.is_action_just_pressed("ui_accept"):
		_lamp_turn_on()
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().call_group("FADEOUT", "fade_out")
		get_tree().call_group("MUSIC", "fade_out")
		set_physics_process(false)

func _animate(delta : float):
	if velocity.length() > .1:
		animator.play("Walk", .0)
		if not walk_sfx.playing:
			walk_sfx.play()
	else:
		animator.play("Stop", .25)
		if walk_sfx.playing:
			walk_sfx.stop()
		
func _lamp_turn_on():
	lamplight.turn_on()

func hurt():
	player_life = player_life - 1.0
	
func die():
	print("Character died")
	
func _respawn():
	global_position = Vector2.ZERO

func _ready():
	call_deferred("_respawn")

func _on_Area2D_body_entered(body):
	if body.is_in_group("GHOST"):
		hurt()
