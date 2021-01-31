extends Light2D

export(int) var wait_time : int = 5
export(float) var light_time : float = 2.0

onready var area  := $Area2D
onready var tween := $Tween
onready var timer := $Timer

onready var gbm = get_tree().get_nodes_in_group("GBM")[0]

onready var ready = true
onready var running = false

var time : int

func turn_on():
	if not ready: return
	area.set_collision_layer_bit(0, true)
	enabled = true
	running = true
	ready = false
	time = wait_time
	tween.interpolate_property(self, "energy",
			3.0, .0, light_time, Tween.TRANS_CUBIC, Tween.EASE_IN)
	tween.start()
	get_tree().call_group("PLAYER_LIGHT", "colorize")
	get_tree().call_group("LAMP_LISTENER", "on_lamp_used")

func _on_Tween_tween_all_completed():
	enabled = false
	area.set_collision_layer_bit(0, false)
	running = false
	timer.start()

func _on_Timer_timeout():
	time -= 1
	if time <= 0:
		timer.stop()
		ready = true
		get_tree().call_group("LAMP_LISTENER", "on_lamp_ready")

func _on_Area2D_body_entered(body):
	if body.is_in_group("GHOST"):
		gbm.busted(body)
	
func _on_Area2D_area_entered(area):
	if area.is_in_group("STEP"):
		gbm.step_found(area)
