extends Node

signal player_data_created(data)
signal player_data_erased(id)

onready var peer        = null

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
	emit_signal("player_data_created",
			{
				"id": get_tree().get_network_unique_id(),
				"nickname": "",
				"type": -1,
				"pos_x": 0.0,
				"pos_y": 0.0,
			})

func _on_peer_connected(id):
	emit_signal("player_data_created", 
			{
				"id": id,
				"nickname": "",
				"type": -1,
				"pos_x": 0.0,
				"pos_y": 0.0,
			})
	print("Connected ",id)

func _on_peer_disconnected(id):
	emit_signal("player_data_erased", id)
	print("Disconnected ",id)

