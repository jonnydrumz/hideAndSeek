extends Node2D

export(int) var width  : int = 3
export(int) var height : int = 3

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
#		pos.x = -y * 416.0
#		pos.x = 0 if (y % 2) == 1 else 416

func _new_tile(pos : Vector2) -> Sprite:
	var spr : Sprite = Sprite.new()
	spr.global_position = pos
	spr.texture = floor_texture
	return spr
