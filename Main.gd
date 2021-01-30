extends Node

func _on_StartMenu_create_pressed(port):
	$NetworkManager.create_server(port)

func _on_StartMenu_join_pressed(ip, port):
	$NetworkManager.join_server(ip, port)

func _on_StartMenu_name_entered(name):
	$NetworkManager.name_entered(name)

func _on_NetworkManager_player_accepted():
	$StartMenu.accept_player()

func _on_NetworkManager_player_data_received(players):
	$StartMenu.update_players(players)
