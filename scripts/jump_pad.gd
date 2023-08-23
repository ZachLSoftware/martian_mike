extends Area2D

@onready var anim_sprite = $AnimatedSprite2D

#signal launch
@export var launch_speed = 350


func _on_body_entered(body):
	if body is Player && !body.is_on_floor():
		#emit_signal("launch", launch_speed, body)
		body.velocity.y=0
		body.jump(launch_speed)
		anim_sprite.play("jump")
