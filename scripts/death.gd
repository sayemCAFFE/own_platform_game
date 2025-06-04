extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("extra"):
		body.queue_free()
	if body.is_in_group("player"):
		call_deferred("_player_die")
	if body.is_in_group("enemy_bullet"):
		body.queue_free()
	

func _player_die():
	get_tree().reload_current_scene()
