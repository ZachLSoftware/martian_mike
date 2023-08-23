extends ParallaxBackground

@onready var sprite = $ParallaxLayer/Sprite2D
@export var scroll = 15

@export var bg_texture: CompressedTexture2D = preload("res://assets/textures/bg/Blue.png")


func _ready():
	sprite.texture = bg_texture
	
func _process(delta):
	if sprite.region_rect.position >  Vector2(64,64):
		sprite.region_rect.position = Vector2.ZERO
	sprite.region_rect.position += delta * Vector2(scroll, scroll)
