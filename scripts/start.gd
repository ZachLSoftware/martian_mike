extends StaticBody2D

@onready var spawn = $SpawnPoint

func get_spawn_pos():
	return spawn.global_position
