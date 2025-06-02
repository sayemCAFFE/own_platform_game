extends Node2D

var water_scene = preload("res://scenes/water_drop.tscn")

func water_load():
	var water = water_scene.instantiate()
	$water_node.add_child(water)
	water.global_position = $water_marker.global_position
	water_load2()

func water_load2():
	var water = water_scene.instantiate()
	$water_node.add_child(water)
	water.global_position = $water_marker2.global_position

func _on_water_timer_timeout() -> void:
	water_load()
