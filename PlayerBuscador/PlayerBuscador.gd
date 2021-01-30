extends KinematicBody2D

onready var velocity : Vector2 = Vector2.ZERO

func _physics_process(delta : float):
	_move(delta)
	velocity = move_and_slide(velocity, Vector2.UP, false, 4.0)

func _move(delta : float):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -64.0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 64.0
	if Input.is_action_pressed("ui_up"):
		velocity.y = -32.0
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 32.0
