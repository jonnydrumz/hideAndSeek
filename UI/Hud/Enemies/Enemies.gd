extends HBoxContainer

signal game_completed

export(Texture) var item_texture : Texture

func on_enemy_death():
	_update_skulls()

func _ready():
	call_deferred("_update_skulls")

func _update_skulls():
	_clear_skulls()
	var enemies = get_tree().get_nodes_in_group("GHOST")
	_add_skulls(enemies)
	print(enemies.size())
	if enemies.size() <= 0:
		emit_signal("game_completed")

func _clear_skulls():
	for child in get_children():
		child.queue_free()

func _add_skulls(enemies):
	for enemy in enemies:
		var item = TextureRect.new()
		item.texture = item_texture
		add_child(item)
