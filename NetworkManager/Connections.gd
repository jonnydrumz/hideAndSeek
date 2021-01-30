extends Node

signal player_data_created(data)
signal player_data_erased(id)

onready var host = get_parent()

onready var peer        = null

const DEFAULT_USERS = 10

func _ready():
	get_tree().connect("network_peer_connected", self, "_on_peer_connected")
	get_tree().connect("network_peer_disconnected", self, "_on_peer_disconnected")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

func create_server(port):
	peer = NetworkedMultiplayerENet.new()
	peer.set_compression_mode(NetworkedMultiplayerENet.COMPRESS_RANGE_CODER)
	var err = peer.create_server(port, DEFAULT_USERS) # Maximum of 1 peer, since it's a 2-player game.
	if err != OK:
		emit_signal("connection_failed", "Address in use")
		return
	print("Waiting for player...")
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
	print("Connecting...")

func _create_player_server():
	var data = {
				"id": get_tree().get_network_unique_id(),
				"nickname": "",
				"type": -1,
				"pos_x": 0.0,
				"pos_y": 0.0,
			}
	emit_signal("player_data_created", data)
	if get_tree().is_network_server():
		_player_accepted()
	else:
		rpc_id(data.id, "_player_accepted")

func _on_peer_connected(id):
	var data = {
				"id": id,
				"nickname": "",
				"type": -1,
				"pos_x": 0.0,
				"pos_y": 0.0,
			}
	emit_signal("player_data_created", data)
	print("Connected ",id)
	if get_tree().is_network_server():
		_player_accepted()
	else:
		rpc_id(data.id, "_player_accepted")

remote func _player_accepted():
	print("Player accepted")
	host.emit_signal("player_accepted") 
	

func _on_peer_disconnected(id):
	emit_signal("player_data_erased", id)
	print("Disconnected ",id)

