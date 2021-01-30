extends Node

onready var host = get_parent()

func name_entered(nickname):
	var id = get_tree().get_network_unique_id()
	if get_tree().is_network_server():
		set_player_name(id, nickname)
	else:
		rpc("set_player_name", id, nickname)

remote func set_player_name(id, nickname):
	for player in host.players:
		if player.id == id:
			player.nickname = nickname
	if get_tree().is_network_server():
		update_player_data(host.players)
	else:
		rpc("update_player_data", host.players)
	
remote func update_player_data(players):
	host.emit_signal("player_data_received", players)

func _connected_ok():
	print("Conectado bien")

func _connected_fail():
	print("Conectado mal")

func _ready():
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
