extends CharacterBody2D

class_name Player

@export var gravity = 400
@export var speed = 125
@export var jump_force = 200
@onready var animated_sprite = $AnimatedSprite2D
var active = true

func _physics_process(delta):
	
	if is_on_floor():
		velocity.y=0
	else:
		if velocity.y < 500:
			velocity.y += gravity*delta
		

	var direction = 0	
	if active == true:
		direction = Input.get_axis("move_left", "move_right")
		if direction!=0:
			animated_sprite.flip_h = (direction==-1)
			
		if Input.is_action_just_pressed("jump") && is_on_floor():
			jump(jump_force)
	velocity.x = direction * speed
	update_animations(direction)


		
		
	move_and_slide()
	
func update_animations(direction):
	if direction!=0 && is_on_floor():
		animated_sprite.play("run")
	elif !is_on_floor() && velocity.y<0:
		animated_sprite.play("jump")
	elif !is_on_floor() && velocity.y>=0:
		animated_sprite.play("fall")
	else:
		animated_sprite.play("idle")
		
		
func jump(force):

	velocity.y=-force
