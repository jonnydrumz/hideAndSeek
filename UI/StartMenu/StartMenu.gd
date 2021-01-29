extends Control

func _on_Connection_on_create_pressed(port):
	print("Crear nuevo servidor, puerto ", port)

func _on_Connection_on_join_pressed(ip, port):
	print("Conectar al servidor, ip: ", ip, ", puerto: ", port)

func on_player_setup_received(player_data):
	$SetupPlayer.update_player_data(player_data)
