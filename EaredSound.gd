extends Sprite

enum Direction {
	UP, DOWN, LEFT, RIGHT,
	LEFT_UP, RIGHT_UP,
	LEFT_DOWN, RIGHT_DOWN
}

export(Direction) var direction : int = Direction.UP

var tween : Tween

const FLOAT_EPSILON = PI * .15
const TWOPI = PI * 2.0

const RIGHT = .0
const LEFT = PI
const UP = -PI * .5
const DOWN = PI * .5
const RIGHT_UP = -PI * .25
const LEFT_UP = -PI + PI * .25
const RIGHT_DOWN = PI + PI * .25
const LEFT_DOWN = -PI - PI * .25

func audio_locator_sound_registered(sound_pos : float):
	var dir = sound_pos / 8.0 + TWOPI

	if direction == Direction.UP and _is_up(dir):
		_show()
	elif direction == Direction.RIGHT_UP and _is_rightup(dir):
		_show()
	elif direction == Direction.RIGHT and _is_right(dir):
		_show()
	elif direction == Direction.RIGHT_DOWN and _is_rightdown(dir):
		_show()
	elif direction == Direction.DOWN and _is_down(dir):
		_show()
	elif direction == Direction.LEFT_DOWN and _is_leftdown(dir):
		_show()
	elif direction == Direction.LEFT and _is_left(dir):
		_show()
	elif direction == Direction.LEFT_UP and _is_leftup(dir):
		_show()

func _is_up(texture_pos : float) -> bool:
	return texture_pos >= 6.04 and texture_pos < 6.14
func _is_rightup(texture_pos : float) -> bool:
	return texture_pos >= 6.14 and texture_pos < 6.21
func _is_right(texture_pos : float) -> bool:
	return texture_pos >= 6.21  and texture_pos < 6.3
func _is_rightdown(texture_pos : float) -> bool:
	return texture_pos >= 6.3 and texture_pos < 6.38
func _is_down(texture_pos : float) -> bool:
	return texture_pos >= 6.38 and texture_pos < 6.55
func _is_leftdown(texture_pos : float) -> bool:
	return texture_pos >= 6.55 and texture_pos < 6.62
func _is_left(texture_pos : float) -> bool:
	return texture_pos >= 6.62 or texture_pos < 5.95
func _is_leftup(texture_pos : float) -> bool:
	return texture_pos >= 5.95 and texture_pos < 6.04

func _show():
	show()
	tween.interpolate_property(
			self, "modulate:a",
			.25, .0, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	tween.start()

static func compare_floats(a, b, epsilon = FLOAT_EPSILON):
	return abs(a - b) <= epsilon
	

func _ready():
	tween = Tween.new()
	add_child(tween)
	tween.connect("tween_all_completed", self, "hide")

func _enter_tree():
	hide()
