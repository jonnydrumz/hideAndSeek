extends Node2D

export(PackedScene) var audio_template : PackedScene
export(Array, AudioStream) var audio_streams : Array

export(float) var min_x : float = -2000
export(float) var max_x : float = 2000
export(float) var min_y : float = -1000
export(float) var max_y : float = 1000

onready var timer := $Timer

func _on_Timer_timeout():
	timer.start(rand_range(5, 20))
	var audio_instance = audio_template.instance()
	audio_instance.global_position = Vector2(
			rand_range(min_x, max_x),
			rand_range(min_y, max_y))
	audio_instance.stream = audio_streams[randi() % audio_streams.size()]
	add_child(audio_instance)
