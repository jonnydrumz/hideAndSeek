extends Node


func busted(ghost):
	var tween := Tween.new()
	add_child(tween)
	tween.connect("tween_all_completed", tween, "queue_free")
	tween.connect("tween_all_completed", ghost, "queue_free")
	tween.interpolate_property(ghost, "scale:y",
			ghost.scale.x, .0, .5, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
