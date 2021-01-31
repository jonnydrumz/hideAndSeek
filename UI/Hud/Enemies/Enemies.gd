extends HBoxContainer

export(Texture) var item_texture : Texture

onready var enemy_count : int = LevelConfiguration.enemies_count

func on_enemy_death():
	if get_child_count() > 0:
		get_child(0).queue_free()
	else:
		get_tree().reload_current_scene()

func _ready():
	for i in range(enemy_count):
		var item = TextureRect.new()
		item.texture = item_texture
		add_child(item)
