extends Node

func _on_StartMenu_created_pressed(port):
	$NetworkManager.create_server(port)

func _on_StartMenu_joined_pressed(ip, port):
	$NetworkManager.join_server(ip, port)

func _on_NetworkManager_player_accepted():
	$StartMenu.accept_player()

func _on_StartMenu_name_entered(nickname):
	$NetworkManager.name_entered(nickname)
