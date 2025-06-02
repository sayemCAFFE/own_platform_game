extends CharacterBody2D

const jump_speed : float = -500.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var ground_in_front : bool = true

func _ready() -> void:
	%jumping_enemy.play("jump")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		print("gravity")
		
	if is_on_floor():
		print("is_on_floor")
		enemy_jump()

func enemy_jump():
	velocity.y = jump_speed

func _on_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("tilemap"):
		enemy_jump()
		
	
