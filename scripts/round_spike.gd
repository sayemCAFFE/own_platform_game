extends RigidBody2D

func _ready() -> void:
	$round_spike_anim.play("round")


func _on_round_spike_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalVars.my_life -= 1
		if GlobalVars.my_life == 0:
			call_deferred("reload_scene")

func reload_scene():
	get_tree().reload_current_scene()
	GlobalVars.my_life = 3
