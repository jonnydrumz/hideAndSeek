extends ColorRect
signal fade_out_done

func fade_out():
	show()
	$Tween.interpolate_property(self, "modulate:a",
			0.0, 1.0, 2.0,
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Tween_tween_all_completed():
	emit_signal("fade_out_done")
