extends Button

func _on_Play_button_up() -> void:
	PlayerData.score = 0
	get_tree().paused = false
	get_tree().change_scene("res://src/Main Scenes/MainScreen.tscn")
