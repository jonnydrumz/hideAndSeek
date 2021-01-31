extends Control

func _on_Iniciar_pressed():
	get_tree().change_scene("Main.tscn")


func _on_Configuracion_pressed():
	get_tree().change_scene("Configuracion.tscn")
