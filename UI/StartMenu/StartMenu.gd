extends Control
signal create_pressed
signal join_pressed
signal name_entered
signal aaa

func _on_Connection_on_create_pressed(port):
	emit_signal("create_pressed", port)
	emit_signal("aaa")

func _on_Connection_on_join_pressed(ip, port):
	emit_signal("join_pressed", ip, port)

func on_player_setup_received(player_data):
	$SetupPlayer.update_player_data(player_data)

func accept_player():
	$Connection.hide()
	$SetupPlayer.show()
	$SetupPlayer.accept_player()
	print("Conectado")

func _on_SetupPlayer_on_start_pressed(nickname):
	emit_signal("name_entered", nickname)
