extends KinematicBody2D

export(float) var seconds_to_arrive : float = 30.0
export(PackedScene) var steps       : PackedScene

export var transition_duration = 10.00
export var transition_type = 0 # TRANS_SINE

onready var tween := $Tween
onready var visibilization_tween := $VisibilizationTween
onready var steps_counter = 0
onready var enemy_visible = true
onready var walking : bool = false

var tombs
var current_tomb
var seconds

func _ready():
	yield(get_tree().create_timer(rand_range(.25, 4.0)), "timeout")
	tombs = get_tree().get_nodes_in_group("TOMB")
	if tombs.size() > 0:
		call_deferred("movement")
		$TimerSteps.start()
		$TimerShow.start(rand_range(3.0,6.0))

func _on_Tween_tween_all_completed():
	$Timer.start(rand_range(5.0, 15.0))
	$SFX.stop()
	$Ghost.hide()
	enemy_visible = false
	walking = false

func _on_Timer_timeout():
	movement()
	$TimerShow.start(rand_range(3.0,6.0))

func movement():
	$SFX.play()
	current_tomb = tombs[randi() % tombs.size()]
#	print(current_tomb.global_position)
	var length = global_position.distance_to(current_tomb.global_position)
	seconds = global_position.distance_to(current_tomb.global_position) / seconds_to_arrive
	tween.interpolate_property(self, "global_position", global_position, current_tomb.global_position, seconds, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property($SFX, "volume_db", 0, -10, transition_duration, transition_type, Tween.EASE_IN, 0)
	tween.start()
	walking = true

func _on_TimerSteps_timeout():
	if walking:
		var step = steps.instance()
		if (steps_counter % 2 == 0):
			step.is_left = true
		else:
			step.is_left = false
		steps_counter = steps_counter + 1
		get_parent().add_child(step)
		step.rot_pos(global_position, current_tomb.global_position)

func _on_TimerShow_timeout():
	if enemy_visible:
		visibilization_tween.interpolate_property(self, "modulate:a", modulate.a, 0.0, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		visibilization_tween.start()
		enemy_visible = false
	else:
		visibilization_tween.interpolate_property(self, "modulate:a", modulate.a, 1.0, 0.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		visibilization_tween.start()
		enemy_visible = true


func _on_VisibilizationTween_tween_all_completed():
	pass # Replace with function body.
