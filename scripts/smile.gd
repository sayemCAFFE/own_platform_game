extends Area2D

func _ready() -> void:
	$smile_anim.play("smile")
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalVars.my_life -= 1
		if GlobalVars.my_life == 0:
			call_deferred("reload_scene")

func reload_scene():
	get_tree().reload_current_scene()
	GlobalVars.my_life = 3
