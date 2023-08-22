extends CharacterBody2D

@export var gravity = 400
@export var speed = 125
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if is_on_floor():
		velocity.y=0
	else:
		velocity.y += gravity*delta
		
	var direction = Input.get_axis("move_left", "move_right")
	
	velocity.x = direction * speed
	
	if direction!=0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
	if direction==1 && animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif direction==-1 && !animated_sprite.flip_h:
		animated_sprite.flip_h = true
		
		
	move_and_slide()
