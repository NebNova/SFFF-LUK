extends Control

# Gets lable nodes
onready var endScore: Label = get_node("ScoreNum")
onready var endDeath: Label = get_node("DeathNum")

# On ready runs interface update functions
func _ready() -> void:
	update_interface() # Replace with function body.

# Updates player deaths and score
func update_interface() -> void:
	endScore.text = "%s" % PlayerData.score
	endDeath.text = "%s" % PlayerData.deaths
