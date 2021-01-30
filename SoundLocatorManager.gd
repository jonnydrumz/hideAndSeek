extends Node

export(NodePath) var player_nodepath : NodePath

onready var player = get_node(player_nodepath)
onready var targets = []

onready var nearest : Vector2 = Vector2.ZERO

func follow(target : Node2D, time : float = -1):
#	targets.append(target)
#	if time >= .0:
#		yield(get_tree().create_timer(time), "timeout")
#		targets.erase(target)
	var tgt_diff = target.global_position - player.global_position
	get_tree().call_group("AUDIO_LOCATOR_LISTENER",
			"audio_locator_sound_registered",
			tgt_diff.angle()
			)

#func cancel(target : Node2D):
#	targets.erase(target)
#
#func _physics_process(delta : float):
#	if targets.size() == 0:
#		return
#	nearest = _find_nearest()
#
#func _find_nearest() -> Vector2:
#	var near = Vector2.ONE * 9999999.0
#	for target in targets:
#		print(target)
#		var tgt_diff = target.global_position - player.global_position
#		var tgt_prev = near   - player.global_position
#		if tgt_diff.length() > tgt_prev.length():
#			near = tgt_prev
#	return near
