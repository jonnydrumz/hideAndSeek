extends Node

signal player_accepted
signal player_data_received
signal connection_failed(reason)

onready var current_phase = $PlayerRegisterNetworkPhase

onready var players     = []

func create_server(port):
	$Connections.create_server(port)

func join_server(ip, port):
	$Connections.join_server(ip, port)

func _on_Connections_player_data_created(data):
	players.append(data)
	if get_tree().is_network_server():
		current_phase.player_accepted()
	else:
		current_phase.rpc_id(data.id, "player_accepted")

func _on_Connections_player_data_erased(id):
	for player in players:
		if player.id == id:
			players.erase(player)

func name_entered(nickname):
	current_phase.name_entered(nickname)
