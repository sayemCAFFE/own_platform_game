extends CharacterBody2D

const jump_speed : float = -500.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	%jumping_enemy.play("normal")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		%jumping_enemy.play("normal")
		
	if is_on_floor():
		%jumping_enemy.play("jump")
		enemy_jump()
		
	move_and_slide()
	

func enemy_jump():
	velocity.y = jump_speed
	


func _on_collision_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalVars.my_life -= 1
		if GlobalVars.my_life == 0:
			call_deferred("reload_scene")

func reload_scene():
	get_tree().reload_current_scene()
	GlobalVars.my_life = 3
