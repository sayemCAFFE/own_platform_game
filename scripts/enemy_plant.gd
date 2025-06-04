extends Area2D

var plant_bullet_scene = preload("res://scenes/plant_bullet.tscn")
var shot = true

func _ready() -> void:
	$enemy_plant_anim.play("attack")
	$bullet_timer.start()

func create_bullet():
	var bullet = plant_bullet_scene.instantiate()
	$bullet_node.add_child(bullet)
	bullet.global_position = $bullet_pos.global_position

func _process(delta: float) -> void:
	if $enemy_plant_anim.frame == 5:
		if shot == true:
			create_bullet()
			shot = false
		
	if $enemy_plant_anim.frame == 6:
		shot = true

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalVars.my_life -= 1
		if GlobalVars.my_life == 0:
			call_deferred("reload_scene")

func reload_scene():
	get_tree().reload_current_scene()
	GlobalVars.my_life = 3
