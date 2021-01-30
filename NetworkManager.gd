extends Node

signal player_accepted
signal player_data_received
signal connection_failed(reason)

onready var peer        = null
onready var players     = []

const DEFAULT_USERS = 10

func _ready():
	get_tree().connect("network_peer_connected", self, "_on_peer_connected")
	get_tree().connect("network_peer_disconnected", self, "_on_peer_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

func create_server(port):
	peer = NetworkedMultiplayerENet.new()
	peer.set_compression_mode(NetworkedMultiplayerENet.COMPRESS_RANGE_CODER)
	var err = peer.create_server(port, DEFAULT_USERS) # Maximum of 1 peer, since it's a 2-player game.
	if err != OK:
		emit_signal("connection_failed", "Address in use")
		return
	_set_status("Waiting for player...", true)
	get_tree().set_network_peer(peer)
	_create_player_server()

func join_server(ip, port):
	if not ip.is_valid_ip_address():
		emit_signal("connection_failed", "IP address is invalid")
		return

	peer = NetworkedMultiplayerENet.new()
	peer.set_compression_mode(NetworkedMultiplayerENet.COMPRESS_RANGE_CODER)
	peer.create_client(ip, port)
	get_tree().set_network_peer(peer)
	_set_status("Connecting...", true)

func _create_player_server():
	players.append(
		{
			"id": get_tree().get_network_unique_id(),
			"nickname": "",
			"type": -1,
			"pos_x": 0.0,
			"pos_y": 0.0,
		})
	player_accepted()

func _on_peer_connected(id):
	players.append(
		{
			"id": id,
			"nickname": "",
			"type": -1,
			"pos_x": 0.0,
			"pos_y": 0.0,
		})
	print("Connected ", id) 
	rpc_id(id, "player_accepted")
	
func _on_peer_disconnected(id):
	for player in players:
		if player.id == id:
			players.erase(player)
	print("Disconnected ",id)
	
func _set_status(text, is_ok):
	print(is_ok, " ", text)

remote func player_accepted():
	print("Player accepted")
	emit_signal("player_accepted") 

func _connected_ok():
	print("id")

func _connected_fail():
	print("id")

func name_entered(nickname):
	var id = get_tree().get_network_unique_id()
	if get_tree().is_network_server():
		set_player_name(id, nickname)
	else:
		rpc("set_player_name", id, nickname)

remote func set_player_name(id, nickname):
	for player in players:
		if player.id == id:
			player.nickname = nickname
	if get_tree().is_network_server():
		update_player_data(players)
	else:
		rpc("update_player_data", players)
	
remote func update_player_data(players):
	emit_signal("player_data_received", players)
