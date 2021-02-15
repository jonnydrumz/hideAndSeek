extends Node

func _ready():
	ProjectSettings.load_resource_pack("res://lib/GDNet.pck", false)
	var gdnet_client = load("res://GDNet/GDNetClient/GDNetClient.tscn").instance()
	add_child(gdnet_client)
	print(gdnet_client)
	
