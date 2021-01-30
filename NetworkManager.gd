extends Node

signal player_accepted
signal player_data_received

onready var join_button = $JoinButton
onready var host_button = $HostButton
onready var peer        = null
onready var players     = []

const DEFAULT_USERS = 10

func _ready():
	# Connect all the callbacks related to networking.
	get_tree().connect("network_peer_connected", self, "_on_peer_connected")
	get_tree().connect("network_peer_disconnected", self, "_on_peer_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

# Player info, associate ID to data
var player_info = {}
# Info we send to other players
var my_info = { name = "Jon", favorite_color = Color8(255, 0, 255) }

func create_server(port):
	peer = NetworkedMultiplayerENet.new()
	peer.set_compression_mode(NetworkedMultiplayerENet.COMPRESS_RANGE_CODER)
	var err = peer.create_server(port, DEFAULT_USERS) # Maximum of 1 peer, since it's a 2-player game.
	if err != OK:
		# Is another server running?
		_set_status("Can't host, address in use.",false)
		return
	get_tree().set_network_peer(peer)
	_set_status("Waiting for player...", true)

func join_server(ip, port):
	if not ip.is_valid_ip_address():
		_set_status("IP address is invalid", false)
		return

	peer = NetworkedMultiplayerENet.new()
	peer.set_compression_mode(NetworkedMultiplayerENet.COMPRESS_RANGE_CODER)
	peer.create_client(ip, port)
	get_tree().set_network_peer(peer)
	_set_status("Connecting...", true)
	
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

func _on_Button3_pressed():
	for id in players: 
		rpc_id(id, "hola", id)
		
remote func hola(id):
	print(id)

func name_entered(nickname):
	var id = get_tree().get_network_unique_id()
	rpc("set_player_name", id, nickname)

remote func set_player_name(id, nickname):
	for player in players:
		if player.id == id:
			player.nickname = nickname
	print("ID ",id)
	rpc("update_player_data", players)
	
remote func update_player_data(players):
	emit_signal("player_data_received", players)
