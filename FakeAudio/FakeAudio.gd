extends AudioStreamPlayer2D

func _ready():
	play()
	get_tree().call_group("SLM", "follow", self)

func _on_FakeAudio_finished():
	get_tree().call_group("SLM", "cancel", self)
