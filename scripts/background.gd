extends ParallaxBackground

@onready var sprite_2d: Sprite2D = $ParallaxLayer/Sprite2D 

@export var background_texture: CompressedTexture2D = preload("res://assets/textures/bg/Blue.png")
@export var scroll_speed_x: float = 15
@export var scroll_speed_y: float = 15

func _ready() -> void:
	sprite_2d.texture = background_texture

func _process(delta: float) -> void:
	if sprite_2d.region_rect.position >= Vector2(64, 64):
		sprite_2d.region_rect.position = Vector2.ZERO
	sprite_2d.region_rect.position += delta * Vector2(scroll_speed_x, scroll_speed_y)
