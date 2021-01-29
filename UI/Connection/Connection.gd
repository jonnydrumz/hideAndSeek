extends Control

signal on_create_pressed(port)
signal on_join_pressed(ip, port)

func _on_CreateButton_pressed():
	$CreateControl.show()
	$CreateButton.hide()
	$JoinButton.hide()

func _on_JoinButton_pressed():
	$JoinControl.show()
	$CreateButton.hide()
	$JoinButton.hide()

func _on_CreateCreateButton_pressed():
	var port = int($CreateControl/LineEdit.text)
	if port < 1024 or port > 65535:
		$AcceptDialog.popup_centered(Vector2(640, 100))
		$AcceptDialog.dialog_text = "The port must be a number between 1024 and 65535"
		return
	emit_signal("on_create_pressed", port)
	queue_free()

func _on_JoinJoinButton_pressed():
	var port = int($JoinControl/LineEdit2.text)
	if port < 1024 or port > 65535:
		$AcceptDialog.popup_centered(Vector2(640, 100))
		$AcceptDialog.dialog_text = "The port must be a number between 1024 and 65535"
		return
	var ip = $JoinControl/LineEdit.text
	if ip.length() < 1:
		$AcceptDialog.popup_centered(Vector2(640, 100))
		$AcceptDialog.dialog_text = "The ip must be the direction of the player has lalasdfjalsdkfjadsf partida creada xD"
		return
	emit_signal("on_join_pressed", ip, port)
	queue_free()
