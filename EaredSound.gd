extends Sprite

enum Direction {
	UP, DOWN, LEFT, RIGHT,
	LEFT_UP, RIGHT_UP,
	LEFT_DOWN, RIGHT_DOWN
}

export(Direction) var direction : int = Direction.UP

var tween : Tween

const FLOAT_EPSILON = PI * .25

const RIGHT = .0
const LEFT = PI
const UP = -PI * .5
const DOWN = PI * .5
const RIGHT_UP = -PI * .25
const LEFT_UP = -PI + PI * .25
const RIGHT_DOWN = PI + PI * .25
const LEFT_DOWN = -PI - PI * .25

func audio_locator_sound_registered(sound_pos : float):
	if direction == Direction.UP and _is_up(sound_pos) \
	or direction == Direction.LEFT_UP and _is_leftup(sound_pos) \
	or direction == Direction.RIGHT_UP and _is_rightup(sound_pos) \
	or direction == Direction.LEFT and _is_left(sound_pos) \
	or direction == Direction.RIGHT and _is_right(sound_pos) \
	or direction == Direction.LEFT_DOWN and _is_leftdown(sound_pos) \
	or direction == Direction.RIGHT_DOWN and _is_rightdown(sound_pos) \
	or direction == Direction.DOWN and _is_down(sound_pos):
		show()
		tween.interpolate_property(
				self, "modulate:a",
				1.0, .0, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		tween.start()

func _is_up(sound_pos : float) -> bool:
	return compare_floats(sound_pos, RIGHT)
func _is_down(sound_pos : float) -> bool:
	return compare_floats(sound_pos, DOWN)
func _is_left(sound_pos : float) -> bool:
	return compare_floats(sound_pos, LEFT)
func _is_right(sound_pos : float) -> bool:
	return compare_floats(sound_pos, DOWN)
func _is_leftup(sound_pos : float) -> bool:
	return compare_floats(sound_pos, LEFT_UP)
func _is_rightup(sound_pos : float) -> bool:
	return compare_floats(sound_pos, RIGHT_UP)
func _is_leftdown(sound_pos : float) -> bool:
	return compare_floats(sound_pos, LEFT_DOWN)
func _is_rightdown(sound_pos : float) -> bool:
	return compare_floats(sound_pos, RIGHT_DOWN)

static func compare_floats(a, b, epsilon = FLOAT_EPSILON):
	return abs(a - b) <= epsilon
	

func _ready():
	tween = Tween.new()
	add_child(tween)
	tween.connect("tween_all_completed", self, "hide")

func _enter_tree():
	hide()
