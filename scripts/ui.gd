extends Control

func _process(delta: float) -> void:
	$life_label.text = "Life : "+str(GlobalVars.my_life)
