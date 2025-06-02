extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if Input.is_action_pressed("left"):
#		$AttackNode.scale.x = -1
		$player_anim.flip_h = true
		$player_anim.play("walk")
		
	elif Input.is_action_pressed("right"):
#		$AttackNode.scale.x = 1
		$player_anim.flip_h = false
		$player_anim.play("walk")
	
	else:
		$player_anim.play("idle")
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()



#var direction := Vector2.ZERO
#
#@export var speed = 250
#
#const JUMP_VELOCITY = -900.0
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#func _ready():
	#pass
#
#func _input(event):
	#
	#direction.x = 0
	#
	#if Input.is_action_pressed("left"):
		#direction.x -= speed
##		$AttackNode.scale.x = -1
		#$player_anim.flip_h = true
		#$player_anim.play("walk")
		#
	#elif Input.is_action_pressed("right"):
		#direction.x += speed
##		$AttackNode.scale.x = 1
		#$player_anim.flip_h = false
		#$player_anim.play("walk")
	#
	#else:
		#$player_anim.play("idle")
#
#
#func _physics_process(delta):
	#
	#if not is_on_floor():
		#velocity.y += gravity * delta
	#
	#
	#var is_grounded = $ray_cast1.is_colliding() or $ray_cast2.is_colliding()
	#
	#if Input.is_action_just_pressed("jump"):
		#direction.y = JUMP_VELOCITY
			#
	#set_velocity(direction)
	#set_up_direction(Vector2.UP)
	#move_and_slide()
	#direction = velocity
