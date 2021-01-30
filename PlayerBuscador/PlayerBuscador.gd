extends KinematicBody2D

export(float) var player_speed : float = 64.0

onready var velocity : Vector2 = Vector2.ZERO
onready var player_speed_y : float = player_speed * .5

func _physics_process(delta : float):
	_move(delta)
	velocity = move_and_slide(velocity, Vector2.UP, false, 4.0)

func _move(delta : float):
	var leftv = -player_speed if Input.is_action_pressed("ui_left") else .0
	var rightv = player_speed if Input.is_action_pressed("ui_right") else .0
	var upv = -player_speed_y if Input.is_action_pressed("ui_up") else .0
	var downv = player_speed_y if Input.is_action_pressed("ui_down") else .0
	velocity.x = leftv + rightv
	velocity.y = upv + downv
