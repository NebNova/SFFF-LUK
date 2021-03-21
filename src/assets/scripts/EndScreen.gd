extends Control

onready var endScore: Label = get_node("ScoreNum")
onready var endDeath: Label = get_node("DeathNum")

func _ready() -> void:
	update_interface() # Replace with function body.

func update_interface() -> void:
	endScore.text = "%s" % PlayerData.score
	endDeath.text = "%s" % PlayerData.deaths
