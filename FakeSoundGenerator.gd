extends Node2D

export(PackedScene) var audio_template : PackedScene
export(Array, AudioStream) var audio_streams : Array

onready var amount = LevelConfiguration.fakesounds_amount

#onready var width  : int = LevelConfiguration.map_width
#onready var height : int = LevelConfiguration.map_height

onready var min_x : float = -2000
onready var max_x : float = 2000
onready var min_y : float = -1000
onready var max_y : float = 1000

onready var timer := $Timer

func _on_Timer_timeout():
	if rand_range(.05, 1.0) <= amount:
		var audio_instance = audio_template.instance()
		audio_instance.global_position = Vector2(
				rand_range(min_x, max_x),
				rand_range(min_y, max_y))
		audio_instance.stream = audio_streams[randi() % audio_streams.size()]
		add_child(audio_instance)
		audio_instance.play()
