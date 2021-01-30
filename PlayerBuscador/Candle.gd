extends Light2D

export(Color) var ray_color : Color

export(float) var light_time : float = 2.0

onready var tween := $Tween

onready var default_color = color

func colorize():
	tween.interpolate_property(self, "color",
			ray_color, default_color, light_time, Tween.TRANS_CUBIC, Tween.EASE_IN)
	
	tween.start()
