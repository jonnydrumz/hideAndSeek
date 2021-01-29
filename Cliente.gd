extends Control

const address : String = "127.0.0.1"#83.173.176.43"
const DEFAULT_PORT = 2000

var peer = null


func _on_Button_pressed():
	var ip = address
	if not ip.is_valid_ip_address():
		_set_status("IP address is invalid", false)
		return

	peer = NetworkedMultiplayerENet.new()
	peer.set_compression_mode(NetworkedMultiplayerENet.COMPRESS_RANGE_CODER)
	peer.create_client(ip, DEFAULT_PORT)
	get_tree().set_network_peer(peer)

	_set_status("Connecting...", true)

func _set_status(text, isok):
	print(isok, " ", text)

func _connected_ok():
	print("id")

func _connected_fail():
	print("id")

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")
