extends Node2D

func _on_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
