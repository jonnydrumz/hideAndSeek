extends Sprite

onready var lamp := $Lamp

const TWOPI = 2.0 * PI
const FLOAT_EPSILON = .0001

func update_texture(textures : Array, angle : float):
	var texture_pos = angle * 8.0 / TWOPI
	if _is_up(texture_pos):
		texture = textures[0]
		lamp.position = Vector2(28.0, -44.0)
	elif _is_rightdown(texture_pos):
		texture = textures[1]
		lamp.position = Vector2(18.0, -38.0)
	elif _is_down(texture_pos):
		texture = textures[2]
		lamp.position = Vector2(-20.0, -40.0)
	elif _is_leftdown(texture_pos):
		texture = textures[3]
		lamp.position = Vector2(-24.0, -42.0)
	elif _is_left(texture_pos):
		texture = textures[4]
		lamp.position = Vector2(-28.0, -50.0)
	elif _is_leftup(texture_pos):
		texture = textures[5]
		lamp.position = Vector2(-24.0, -56.0)
	elif _is_right(texture_pos):
		texture = textures[6]
		lamp.position = Vector2(22.0, -60.0)
	elif _is_rightup(texture_pos):
		texture = textures[7]
		lamp.position = Vector2(26.0, -56.0)

func _is_up(texture_pos : float) -> bool:
	return compare_floats(texture_pos, .0)
func _is_down(texture_pos : float) -> bool:
	return compare_floats(texture_pos, 2.0)
func _is_left(texture_pos : float) -> bool:
	return compare_floats(texture_pos, 4.0)
func _is_right(texture_pos : float) -> bool:
	return compare_floats(texture_pos, -2.0)
func _is_leftup(texture_pos : float) -> bool:
	return compare_floats(texture_pos, -3.409666)
func _is_rightup(texture_pos : float) -> bool:
	return compare_floats(texture_pos, -0.590334)
func _is_leftdown(texture_pos : float) -> bool:
	return compare_floats(texture_pos, 3.409666)
func _is_rightdown(texture_pos : float) -> bool:
	return compare_floats(texture_pos, 0.590334)

static func compare_floats(a, b, epsilon = FLOAT_EPSILON):
	return abs(a - b) <= epsilon
