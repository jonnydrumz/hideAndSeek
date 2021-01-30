extends AudioStreamPlayer2D

func play(from_position: float = 0.0):
	.play()
	get_tree().call_group("SLM", "follow", self)

func stop():
	.stop()
	get_tree().call_group("SLM", "cancel", self)
