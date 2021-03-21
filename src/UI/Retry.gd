extends Button

func _on_Retry_button_up() -> void:
	PlayerData.score = 0
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://src/Main Scenes/Main.tscn")
