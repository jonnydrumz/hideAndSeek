extends Node

export(PackedScene) var enemy_template : PackedScene
export(int) var radius : int = 3
export(NodePath) var destination_nodepath : NodePath

onready var enemy_count_to_start : int = LevelConfiguration.enemies_count

onready var destination : Node2D = get_node(destination_nodepath)

func build():
	for i in range(enemy_count_to_start):
		var enemy_instance = enemy_template.instance()
		destination.add_child(enemy_instance)
		enemy_instance.global_position.x = sin(i) * radius
		enemy_instance.global_position.y = cos(i) * radius

func _ready():
	call_deferred("build")
