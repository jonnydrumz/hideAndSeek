extends HBoxContainer

export(Texture) var item_texture : Texture

func on_enemy_death():
	_update_skulls()

func _ready():
	call_deferred("_update_skulls")

func _update_skulls():
	_clear_skulls()
	_add_skulls()

func _clear_skulls():
	for child in get_children():
		child.queue_free()

func _add_skulls():
	for enemy in get_tree().get_nodes_in_group("GHOST"):
		var item = TextureRect.new()
		item.texture = item_texture
		add_child(item)
