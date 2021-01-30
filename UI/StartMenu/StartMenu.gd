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

func update_players(players):
	$SetupPlayer.update_players(players)

func accept_player():
	$SetupPlayer.accept_player()
	print("Conectado")

func _on_SetupPlayer_on_start_pressed(nickname):
	emit_signal("name_entered", nickname)
