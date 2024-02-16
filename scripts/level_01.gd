extends Node2D


@onready var start_position: Marker2D = $StartPosition

func _ready() -> void:
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.connect("touched_player", _on_trap_touched_player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func reset_player(body: Node2D) -> void:
	body.velocity = Vector2.ZERO
	body.global_position = start_position.global_position

func _on_deathzone_body_entered(body: Node2D) -> void:
	reset_player(body)

func _on_trap_touched_player(body: Node2D) -> void:
	reset_player(body)
