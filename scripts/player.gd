extends CharacterBody2D
class_name Player

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var gravity: float = 400
@export var gravity_cap: float = 500
@export var run_speed: float = 125
@export var jump_force: float = 200


func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > gravity_cap:
			velocity.y = gravity_cap
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		jump(jump_force)
	
	var direction: float = Input.get_axis("move_left", "move_right") # returns -1, 0, or 1
	if (direction != 0): # ensures sprite is facing the right direction
		animated_sprite_2d.flip_h = (direction == -1) 
	velocity.x = direction * run_speed 
	
	move_and_slide()
	update_animations(direction)

func jump(force: float) -> void:
	velocity.y = -force

func update_animations(direction: float) -> void:
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		if velocity.y < 0: # if the player is jumping
			animated_sprite_2d.play("jump")
		else:
			animated_sprite_2d.play("fall") 
