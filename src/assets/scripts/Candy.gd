extends Area2D

export var score: = 100 # Sets score of candy

# Readys animation player
onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

# Sets candy despawn timer and deletes candy afterwards
func _ready() -> void:
	yield(get_tree().create_timer(3.0), "timeout")
	queue_free()

# Triggers score and animation when player collides
func _on_body_entered(_body: PhysicsBody2D) -> void:
	picked()

# Gives player scrore and plays despawn animation when player collides
func picked() -> void:
	PlayerData.score += score
	anim_player.play("Poof")
