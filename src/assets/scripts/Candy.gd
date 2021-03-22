extends Area2D

export var score: = 100

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

func _ready() -> void:
	yield(get_tree().create_timer(3.0), "timeout")
	queue_free()

func _on_body_entered(_body: PhysicsBody2D) -> void:
	picked()

func picked() -> void:
	PlayerData.score += score
	anim_player.play("Poof")
