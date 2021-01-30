extends YSort

func _ready():
	$Matrix.build()
	_create_floor($Matrix.width, $Matrix.height)

func _create_floor(w : int, h : int):
	for y in range(h):
		for x in range(w):
			print(x, "  ", y)
