extends Node

enum Tile {
	EMPTY,
	LIMITL,
	LIMITR,
	COLUMN,
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

onready var amount : float = LevelConfiguration.objects_amount
onready var width  : int = LevelConfiguration.map_width
onready var height : int = LevelConfiguration.map_height

var data = []

func build():
	var real_height = height * 16
	var real_width = width * 16
	var tomb_count = 0
	for y in range(real_height):
		var line = []
		for x in range(real_width):
			if x > 0 and y > 0 and x < real_width - 2 and y < real_height - 2:
				var item = _random_tile()
				if item > 3 and item < 10: tomb_count += 1
				line.append(item)
			else:
				if x == 0 and y == 0 \
				or x == 0 and y == real_height - 1 \
				or x == real_width -1 and y == 0 \
				or x == real_width -1 and y == real_height -1:
					line.append(Tile.COLUMN)
				elif x == 0:
					line.append(Tile.LIMITL)
				elif y == 0:
					line.append(Tile.LIMITR)
				elif x == real_width - 1:
					line.append(Tile.LIMITL)
				elif y == real_height - 1:
					line.append(Tile.LIMITR)
				else:
					line.append(Tile.EMPTY)
		data.append(line)
	if tomb_count < 1:
		for y in range(real_height):
			for x in range(real_width):
				if data[y][x] > 4: data[y][x] = 4

func _random_tile():
	if rand_range(0.0, 1.0) >= amount:
		return Tile.EMPTY
	return (randi() % 9) + 4
