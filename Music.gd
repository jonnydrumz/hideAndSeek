extends AudioStreamPlayer

export(float) var vol : float = -6.0

func _ready():
	var tween : Tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(self, "volume_db",
			-80.0, vol, 1.0,
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
	tween.connect("tween_all_completed", tween, "queue_free")

func _enter():
	volume_db = -80.0
