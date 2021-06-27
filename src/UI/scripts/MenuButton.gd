extends Button

# Starts game and sets score to 0
func _on_Play_button_up() -> void:
	PlayerData.score = 0
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://src/Main Scenes/MainScreen.tscn")
