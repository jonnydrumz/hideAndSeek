extends Node

export(PackedScene) var enemy_template : PackedScene
export(int) var enemy_count_to_start : int = 20
export(int) var radius : int = 3
export(NodePath) var destination_nodepath : NodePath

onready var destination : Node2D = get_node(destination_nodepath)

func build():
	for i in range(enemy_count_to_start):
		var enemy_instance = enemy_template.instance()
