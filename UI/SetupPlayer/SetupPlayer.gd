extends Control

signal on_start_pressed(nickname)

func update_player_data(player_data):
	$Wait.hide()
	$TypeLabel.text = player_data.nickname

func update_players(players):
	for player in players:
		$UserList.add_item(player.nickname)
	$StartButton.visible = get_tree().is_network_server()
	$UserList.show()

func _on_SetNickButton_pressed():
	var nickname = $LineEdit.text
	if nickname.length() < 1:
		$AcceptDialog.popup_centered(Vector2(640, 100))
		$AcceptDialog.dialog_text = "Your nickname is too short"
		return
	emit_signal("on_start_pressed", nickname)
	$SetNickButton.hide()
	$Label2.hide()

func accept_player():
	$Wait.hide()
	$SetNickButton.show()

func _on_StartButton_pressed():
	print("OKKKK")

