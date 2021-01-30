extends Node

enum Tile {
	EMPTY,
	TOMB1L,
	TOMB2L,
	TOMB3L,
	TOMB1R,
	TOMB2R,
	TOMB3R
}

export(float, .0, 1.0) var amount : float = .5
const width    : int = 1
const height   : int = 1

var data = []

func build():
	for y in range(height):
		var line = []
		for x in range(width):
			line.append(_random_tile())
		data.append(line)

func _random_tile():
	if rand_range(0.0, 1.0) <= amount:
		return Tile.EMPTY
	return (randi() % 6) + 1
