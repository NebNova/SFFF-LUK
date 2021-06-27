extends Node

# Holds death and score signals
signal score_updated
signal player_died

# Sets initial score and death
var score: = 0 setget set_score
var deaths: = 0 setget set_deaths

# Updates score value
func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")

# Updates death value
func set_deaths(value: int) -> void:
	deaths = value
	emit_signal("player_died")
