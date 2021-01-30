extends KinematicBody2D

export(float) var seconds_to_arrive : float = 30.0
export(PackedScene) var steps       : PackedScene

export var transition_duration = 10.00
export var transition_type = 0 # TRANS_SINE

onready var tween := $Tween
onready var steps_counter = 0
var tombs
var current_tomb
var rng = RandomNumberGenerator.new()
var seconds


func _ready():
	tombs = get_tree().get_nodes_in_group("TOMB")
	if tombs.size() > 0:
		call_deferred("movement")
		$TimerSteps.start()

func _on_Tween_tween_all_completed():
	$Timer.start(rand_range(5.0, 15.0))
	$SFX.stop()


func _on_Timer_timeout():
	movement()
	

func movement():
	rng.randomize()
	$SFX.play()
	current_tomb = tombs[rng.randi() % tombs.size()]
	var length = position.distance_to(current_tomb.global_position)
	seconds = position.distance_to(current_tomb.global_position) / seconds_to_arrive
	tween.interpolate_property(self, "position", position, current_tomb.global_position, seconds, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property($SFX, "volume_db", 0, -10, transition_duration, transition_type, Tween.EASE_IN, 0)
	tween.start()


func _on_TimerSteps_timeout():
	var step = steps.instance()
	if (steps_counter % 2 == 0):
		step.is_left = true
	else:
		step.is_left = false
	steps_counter = steps_counter + 1
	step.global_position = global_position
	step.rotation = current_tomb.global_position.angle_to(global_position)
	get_parent().add_child(step)
