extends KinematicBody2D

export(float) var player_speed : float = 64.0
export(float) var animation_speed : float = 2.0

onready var lamplight : Light2D = $LampLight

onready var animator  : AnimationPlayer = $AnimationPlayer

onready var velocity : Vector2 = Vector2.ZERO
onready var angle    : float   = .0
onready var player_speed_y : float = player_speed * .5

func _physics_process(delta : float):
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
	

func _action(delta : float):
	if Input.is_action_just_pressed("ui_accept"):
		_lamp_turn_on()

func _animate(delta : float):
	# esto esta hecho asi para poder hacer una velocidad de animacion acorde al movimiento
	if velocity.length() > .1:
		animator.playback_speed = animation_speed
	else:
		animator.playback_speed = .0

func _lamp_turn_on():
	lamplight.turn_on()
