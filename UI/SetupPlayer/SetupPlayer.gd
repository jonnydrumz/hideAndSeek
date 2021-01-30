extends Control

signal on_start_pressed(nickname)

onready var my_name = null

func update_player_data(player_data):
	$Wait.hide()
	$TypeLabel.text = player_data.nickname

func update_players(players):
	if my_name == null: return
	$UserList.clear()
	for player in players:
		$UserList.add_item(player.nickname)
	$StartButton.visible = get_tree().is_network_server()
	$UserList.show()

func _on_SetNickButton_pressed():
	my_name = $LineEdit.text
	if my_name.length() < 1:
		$AcceptDialog.popup_centered(Vector2(640, 100))
		$AcceptDialog.dialog_text = "Your nickname is too short"
		return
	emit_signal("on_start_pressed", my_name)
	$SetNickButton.hide()
	$Label2.hide()

func accept_player():
	if my_name != null: return
	$Wait.hide()
	$SetNickButton.show()

func _on_StartButton_pressed():
	print("OKKKK")

