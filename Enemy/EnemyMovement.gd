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
	set_process(true)
	
func _process(delta):
	tween.interpolate_property(self, "position", position, current_tomb.position, seconds, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()

func _on_Tween_tween_completed(object, key):
	# Go to a new tomb
	rng.randomize()
	position = current_tomb.position
	current_tomb = tombs[rng.randi()%tombs.size()]
	var length = position.distance_to(current_tomb.position)
	seconds = position.distance_to(current_tomb.position) / seconds_to_arrive
	tween.stop(object)
