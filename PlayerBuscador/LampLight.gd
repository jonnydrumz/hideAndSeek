extends Light2D

export(int) var wait_time : int = 5
export(float) var light_time : float = 2.0

onready var tween := $Tween
onready var timer := $Timer

onready var ready = true
onready var running = false

var time : int

func turn_on():
	if not ready: return
	enabled = true
	running = true
	ready = false
	time = wait_time
	tween.interpolate_property(self, "energy",
			3.0, .0, light_time, Tween.TRANS_CUBIC, Tween.EASE_IN)
	tween.start()

func _on_Tween_tween_all_completed():
	enabled = false
	running = false
	timer.start()

func _on_Timer_timeout():
	time -= 1
	if time <= 0:
		timer.stop()
		ready = true

func _on_Area2D_area_entered(area):
	if area.is_in_group("GHOST"):
		print("CAZADO")
