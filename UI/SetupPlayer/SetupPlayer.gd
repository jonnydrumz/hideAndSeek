extends Control

signal on_start_pressed(nickname)

func update_player_data(player_data):
	$Wait.hide()
	$TypeLabel.text = player_data.name

func _on_Button_pressed():
	emit_signal("on_start_pressed", $LineEdit.text)
	$Button.hide()
	$LineEdit.hide()
	$Label2.hide()
