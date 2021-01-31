extends Control

func _on_Iniciar_pressed():
	LevelConfiguration.map_height = $MapHeight.value
	LevelConfiguration.map_width = $MapWidth.value
	LevelConfiguration.enemies_count = $EnemyNumber.value
	LevelConfiguration.objects_amount = $GraveAmount.value
	get_tree().change_scene("Main.tscn")

