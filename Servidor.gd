extends Control

onready var join_button = $JoinButton
onready var host_button = $HostButton
onready var peer        = null
onready var players     = []

const address : String = "127.0.0.1"#83.173.176.43"
const DEFAULT_PORT = 8910

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

func _on_Button_pressed():
	peer = NetworkedMultiplayerENet.new()
	peer.set_compression_mode(NetworkedMultiplayerENet.COMPRESS_RANGE_CODER)
	var err = peer.create_server(8910, 10) # Maximum of 1 peer, since it's a 2-player game.
	if err != OK:
		# Is another server running?
		_set_status("Can't host, address in use.",false)
		return
	get_tree().set_network_peer(peer)
	_set_status("Waiting for player...", true)

	# Only show hosting instructions when relevant.
	
func _on_peer_connected(id):
	players.append(id)
	print(id) 
	
func _on_peer_disconnected(id):
	players.erase(id)
	print(id)
	
func _set_status(text, is_ok):
	print(is_ok, " ", text)

remote func register_player(info):
	# Get the id of the RPC sender.
	var id = get_tree().get_rpc_sender_id()
	# Store the info
	player_info[id] = info

func _on_Button2_pressed():
	var ip = address
	if not ip.is_valid_ip_address():
		_set_status("IP address is invalid", false)
		return

	peer = NetworkedMultiplayerENet.new()
	peer.set_compression_mode(NetworkedMultiplayerENet.COMPRESS_RANGE_CODER)
	peer.create_client(ip, DEFAULT_PORT)
	get_tree().set_network_peer(peer)
	_set_status("Connecting...", true)

func _connected_ok():
	print("id")

func _connected_fail():
	print("id")

func _on_Button3_pressed():
	for id in players: 
		rpc_id(id, "hola", id)

remote func hola(id):
	print(id)
