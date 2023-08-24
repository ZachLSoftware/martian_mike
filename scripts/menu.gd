extends Control


var bg_colors = [
	"res://assets/textures/bg/Blue.png",
	"res://assets/textures/bg/Brown.png",
	"res://assets/textures/bg/Gray.png",
	"res://assets/textures/bg/Green.png",
	"res://assets/textures/bg/Pink.png",
	"res://assets/textures/bg/Purple.png",
	"res://assets/textures/bg/Yellow.png"
]

@onready var bg_sprite = $BG/ParallaxLayer/Sprite2D
var bg_file = bg_colors.pick_random()
@export var bg_texture: CompressedTexture2D = load(bg_file)

func _ready():
	bg_sprite.texture=bg_texture

func _on_start_btn_pressed():
		get_tree().change_scene_to_file("res://scenes/level.tscn")
		



func _on_button_pressed():
	get_tree().quit()
