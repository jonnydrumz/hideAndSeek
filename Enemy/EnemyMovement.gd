extends KinematicBody2D

export(float) var seconds_to_arrive : float = 30.0

onready var tween := $Tween
var tombs
var current_tomb
var rng = RandomNumberGenerator.new()
var seconds

func _ready():
	tombs = get_tree().get_nodes_in_group("TOMB")
	rng.randomize()
	current_tomb = tombs[rng.randi()%tombs.size()]
	var length = position.distance_to(current_tomb.position)
	seconds = position.distance_to(current_tomb.position) / seconds_to_arrive
	tween.interpolate_property(self, "position", position, current_tomb.position, seconds, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()


func _on_Tween_tween_all_completed():
	$Timer.start(rand_range(5.0,10.0))

	# Go to a new tomb
#	rng.randomize()
#	position = current_tomb.position
#	current_tomb = tombs[rng.randi()%tombs.size()]
#	var length = position.distance_to(current_tomb.position)
#	seconds = position.distance_to(current_tomb.position) / seconds_to_arrive
	


func _on_Timer_timeout():
	rng.randomize()
	current_tomb = tombs[rng.randi()%tombs.size()]
	var length = position.distance_to(current_tomb.position)
	seconds = position.distance_to(current_tomb.position) / seconds_to_arrive
	tween.interpolate_property(self, "position", position, current_tomb.position, seconds, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()
