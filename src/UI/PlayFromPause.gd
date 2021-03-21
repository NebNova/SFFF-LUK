extends Button

func _on_Play_button_up() -> void:
	get_tree().paused = false
	get_tree().change_scene("res://src/Main Scenes/MainScreen.tscn")
