extends Node

onready var goto_menu_on_quit : bool = true

onready var initial_time : int = OS.get_system_time_secs()

func _ready():
	randomize()

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

func _on_FadeOut_fade_out_done():
	get_tree().change_scene("res://Menu.tscn")

func _on_Enemies_game_completed():
	var current_time = OS.get_system_time_secs()
	var elapsed = current_time - initial_time
	$CanvasLayer/HUD/EndScreen.open(elapsed)

func _on_EndScreen_quit_pressed():
	goto_menu_on_quit = true
	$Ingame/Music.fade_out()
	$CanvasLayer/HUD/FadeOut.fade_out()
	
func _on_EndScreen_retry_pressed():
	goto_menu_on_quit = false
	$Ingame/Music.fade_out()
	$CanvasLayer/HUD/FadeOut.fade_out()
	
