extends Node2D
class_name Steps

export(bool) var is_left : bool

func _ready():
	if is_left : $Izquierdo.show()
	else : $Derecho.show()
