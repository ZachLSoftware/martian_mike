extends Node2D

@export var next_level: PackedScene = null
@onready var start_position = $Start
@onready var exit = $Exit
var player = null


func _ready():
	player = get_tree().get_first_node_in_group("player")
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.touched_player.connect(_on_trap_touched_player)
		
	player.global_position = start_position.get_spawn_pos()
	
	exit.body_entered.connect(_on_exit_body_entered)

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quite()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()




func _on_deathzone_body_entered(body):
	body.velocity=Vector2.ZERO
	body.global_position=start_position.get_spawn_pos()


#func _on_jump_pad_launch(launch_speed, body):
#	body.velocity.y=0
#	body.velocity.y=-launch_speed


func _on_trap_touched_player():
	reset_player()
	
func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position=start_position.get_spawn_pos()
	
func _on_exit_body_entered(body):
	if body is Player:
		exit.animate()
		body.active=false
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_packed(next_level)
