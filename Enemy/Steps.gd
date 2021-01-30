extends Node2D
class_name Steps

export(bool) var is_left : bool

func _ready():
	if is_left : $Izquierdo.show()
	else : $Derecho.show()
	print(modulate.a)
	$Tween.interpolate_property(self, "modulate:a",
			modulate.a, .0, 10.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()

func rot_pos(initial_pos : Vector2, destination_pos : Vector2):
	var diff : Vector2 = destination_pos - initial_pos
	$Izquierdo.rotation = diff.angle()
	$Derecho.rotation = $Izquierdo.rotation
	global_position = initial_pos


#func _enter_tree():
#	hide()
#	$Izquierdo.hide()
#	$Derecho.hide()


func _on_Tween_tween_all_completed():
	queue_free()
