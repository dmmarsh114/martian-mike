extends Node2D

signal touched_player(body: Node2D)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		touched_player.emit(body)
