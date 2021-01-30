extends YSort

export(Array, PackedScene) var templates : Array

func _ready():
	$Matrix.build()
	_put_elements()

func _put_elements():
	var data = $Matrix.data
	var rows = data
	var pos : Vector2 = Vector2.ZERO#Vector2(-832, -208)
	var y = 0
	for row in rows:
		var x = 0
		for col in row:
			if col > 0:
				var obj = templates[col - 1].instance()
				obj.global_position = pos
				add_child(obj)
			pos.x += 26.0
			pos.y -= 13.0
			x += 1
		pos.y = (y + 1) * 13.0
		pos.x = 26.0 * (y + 1)
		y += 1

	position.x = -$Matrix.width * 312.0 - 380.0
#	position.y = -$Matrix.height * 208.0
