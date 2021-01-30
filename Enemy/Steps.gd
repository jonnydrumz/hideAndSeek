extends Node2D
class_name Steps

export(bool) var is_left : bool

func _ready():
	if is_left : $Izquierdo.show()
	else : $Derecho.show()
	$Tween.interpolate_property(self, "modulate:a",
			modulate.a, .0, 10.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()

func _enter_tree():
	hide()
	$Izquierdo.hide()
	$Derecho.hide()
