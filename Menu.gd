extends Control

func _on_Iniciar_pressed():
	$FadeOut.fade_out()

func _on_FadeOut_fade_out_done():
	LevelConfiguration.map_height = $MapHeight.value
	LevelConfiguration.map_width = $MapWidth.value
	LevelConfiguration.enemies_count = $EnemyNumber.value
	LevelConfiguration.objects_amount = $GraveAmount.value
	get_tree().change_scene("Main.tscn")
