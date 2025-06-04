extends CharacterBody2D

var bullet_speed = -300

func _physics_process(delta: float) -> void:
	
	velocity.x = bullet_speed
	
	move_and_slide()

func _on_plant_bullet_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalVars.my_life -= 1
		if GlobalVars.my_life == 0:
			call_deferred("reload_scene")
		queue_free()
	if body.is_in_group("tilemap"):
		queue_free()

func reload_scene():
	get_tree().reload_current_scene()
	GlobalVars.my_life = 3
