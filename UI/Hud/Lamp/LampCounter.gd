extends TextureRect

export(Texture) var ready_texture : Texture
export(Texture) var used_texture  : Texture

func on_lamp_used():
	texture = used_texture

func on_lamp_ready():
	texture = ready_texture
	$AudioStreamPlayer.play()

func _ready():
	texture = ready_texture
