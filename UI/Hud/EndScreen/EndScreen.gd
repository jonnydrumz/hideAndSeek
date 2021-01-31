extends Control

signal retry_pressed
signal quit_pressed

func open(elapsed):
	var time = _str_time(elapsed)
	$TimeValue.text = time
	$AnimationPlayer.play("Open")

func _end_open_animation():
	$AnimationPlayer.play("Anim")

func _on_RetryButton_pressed():
	$RetryButton/AudioStreamPlayer.play()
	emit_signal("retry_pressed")

func _on_QuitButton_pressed():
	$QuitButton/AudioStreamPlayer.play()
	emit_signal("quit_pressed")

func _str_time(secs : int)-> String:
	if secs < 0: return "--:--"
	if secs > 5999: return "99:59"
	var seconds_str = int_to_filled_string(secs % 60, 2)
	var minutes_str = int_to_filled_string(secs / 60, 2)
	return minutes_str + ":" + seconds_str

func int_to_filled_string(num : int, digits : int) -> String:
	var positive : bool   = num >= 0
	var r        : String = str(abs(num))
	var d        : int    = digits if positive else digits - 1
	while r.length() < d: r = "0" + r
	if !positive: r = "-" + r
	return r

func _enter_tree():
	hide()
