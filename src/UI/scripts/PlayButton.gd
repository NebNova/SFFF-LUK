extends Button

# Starts new game
func _on_Play_button_up() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://src/Main Scenes/Main.tscn")
