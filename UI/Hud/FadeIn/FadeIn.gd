extends ColorRect

func _ready():
	$Tween.interpolate_property(self, "modulate:a",
			1.0, .0, 2.0,
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()

func _enter_tree():
	show()


func _on_Tween_tween_all_completed():
	queue_free()
