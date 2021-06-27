extends Control

# Readys UI elements
onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var score: Label = get_node("Label")
onready var pauseScore: Label = get_node("PauseOverlay/Score/ScoreNum")
onready var pauseDeath: Label = get_node("PauseOverlay/Death/DeathNum")

# Instantiates pause variable
var paused: = false setget set_paused

# Sets player score on ready
func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	update_interface()

# Pauses and unpauses game
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()

# Updates score and death
func update_interface() -> void:
	score.text = "%s" % PlayerData.score
	pauseScore.text = "%s" % PlayerData.score
	pauseDeath.text = "%s" % PlayerData.deaths

# Sets pause overlay
func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
	get_node("Label").visible = not value
