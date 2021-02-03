extends Control

func _on_Iniciar_pressed():
	$FadeOut.fade_out()
	$Music.fade_out()
	$Iniciar.disabled = true
	$Iniciar/AudioStreamPlayer.play()

func _on_Salir_pressed():
	get_tree().quit()

func _on_FadeOut_fade_out_done():
	LevelConfiguration.map_height = $MapHeight.value
	LevelConfiguration.map_width = $MapWidth.value
	LevelConfiguration.enemies_count = $EnemyNumber.value
	LevelConfiguration.objects_amount = $GraveAmount.value
	LevelConfiguration.fakesounds_amount = $FakeSoundsAmount.value
	get_tree().change_scene("Main.tscn")

func _on_ButtonOnline_pressed():
	$creditos.hide()
	$instrucciones.hide()
	$EnemyNumber.hide()
	$MapHeight.hide()
	$MapWidth.hide()
	$GraveAmount.hide()
	$FakeSoundsAmount.hide()
	$FakeSoundsAmount/Label3.hide()
	$ButtonOnline.hide()
	$ButtonOnlineVolver.show()
	$IniciarOnline.show()
	$Connect.show()
	
func _on_ButtonOnlineVolver_pressed():
	$creditos.show()
	$instrucciones.show()
	$EnemyNumber.show()
	$MapHeight.show()
	$MapWidth.show()
	$GraveAmount.show()
	$FakeSoundsAmount.show()
	$FakeSoundsAmount/Label3.show()
	$ButtonOnline.show()
	$ButtonOnlineVolver.hide()
	$IniciarOnline.hide()
	$Connect.hide()

func _ready():
	# Called every time the node is added to the scene.
	Gamestate.connect("connection_failed", self, "_on_connection_failed")
	Gamestate.connect("connection_succeeded", self, "_on_connection_success")
	Gamestate.connect("player_list_changed", self, "refresh_lobby")
	Gamestate.connect("game_ended", self, "_on_game_ended")
	Gamestate.connect("game_error", self, "_on_game_error")
	# Set the player name according to the system username. Fallback to the path.
	if OS.has_environment("USERNAME"):
		$Connect/Name.text = OS.get_environment("USERNAME")
	else:
		var desktop_path = OS.get_system_dir(0).replace("\\", "/").split("/")
		$Connect/Name.text = desktop_path[desktop_path.size() - 2]

func _on_connection_success():
	$Connect.hide()
	$Players.show()


func _on_connection_failed():
	$Connect/Host.disabled = false
	$Connect/Join.disabled = false
	$Connect/ErrorLabel.set_text("Connection failed.")


func _on_game_ended():
	show()
	$Connect.show()
	$Players.hide()
	$Connect/Host.disabled = false
	$Connect/Join.disabled = false


func _on_game_error(errtxt):
	$ErrorDialog.dialog_text = errtxt
	$ErrorDialog.popup_centered_minsize()
	$Connect/Host.disabled = false
	$Connect/Join.disabled = false

func refresh_lobby():
	var players = Gamestate.get_player_list()
	players.sort()
	$Players/List.clear()
	$Players/List.add_item(Gamestate.get_player_name() + " (You)")
	for p in players:
		$Players/List.add_item(p)

	$Players/Start.disabled = not get_tree().is_network_server()

func _on_Start_pressed():
	Gamestate.begin_game()

func _on_FindPublicIP_pressed():
	OS.shell_open("https://icanhazip.com/")


func _on_Host_pressed():
	if $Connect/Name.text == "":
		$Connect/ErrorLabel.text = "Invalid name!"
		return

	$Connect.hide()
	$Players.show()
	$Connect/ErrorLabel.text = ""

	var player_name = $Connect/Name.text
	Gamestate.host_game(player_name)
	refresh_lobby()


func _on_Join_pressed():
	if $Connect/Name.text == "":
		$Connect/ErrorLabel.text = "Invalid name!"
		return

	var ip = $Connect/IPAddress.text
	if not ip.is_valid_ip_address():
		$Connect/ErrorLabel.text = "Invalid IP address!"
		return

	$Connect/ErrorLabel.text = ""
	$Connect/Host.disabled = true
	$Connect/Join.disabled = true

	var player_name = $Connect/Name.text
	Gamestate.join_game(ip, player_name)
