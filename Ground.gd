extends Node2D

onready var width  : int = LevelConfiguration.map_width
onready var height : int = LevelConfiguration.map_height

export(Texture) var floor_texture : Texture

func _ready():
	var pos : Vector2 = Vector2.ZERO
	for y in range(height):
		for x in range(width):
			add_child(_new_tile(pos))
			pos.x += 416.0
			pos.y -= 208.0
		pos.y = (y + 1) * 208.0
		pos.x = 416.0 * (y + 1)

	position.x = -width * 312.0
#	position.y = -height * 208.0

func _new_tile(pos : Vector2) -> Sprite:
	var spr : Sprite = Sprite.new()
	spr.global_position = pos
	spr.texture = floor_texture
	return spr
