extends Node

enum Tile {
	EMPTY,
	LIMITL,
	LIMITR,
	TOMB1L,
	TOMB2L,
	TOMB3L,
	TOMB1R,
	TOMB2R,
	TOMB3R,
	STONE,
	HIERBA1,
	HIERBA2
}

export(float, .0, 1.0) var amount : float = .5
export(int)            var width  : int = 4
export(int)            var height : int = 4

var data = []

func build():
	var real_height = height * 16
	var real_width = width * 16
	for y in range(real_height):
		var line = []
		for x in range(real_width):
			if x > 0 and y > 0 and x < real_width - 2 and y < real_height - 2:
				line.append(_random_tile())
			else:
				if x == 0:
					line.append(1)
				elif y == 0:
					line.append(2)
				elif x == real_width - 1:
					line.append(1)
				elif y == real_height - 1:
					line.append(2)
				else:
					line.append(0)
		data.append(line)

func _random_tile():
	if rand_range(0.0, 1.0) >= amount:
		return Tile.EMPTY
	return (randi() % 9) + 3
