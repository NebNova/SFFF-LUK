extends KinematicBody2D

export (int) var speed = 150 # Speed variable
var velocity = Vector2() # Velocity variable

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(_delta):
	velocity = Vector2(-speed, 0)
	velocity = move_and_slide(velocity)


func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "wall":
		queue_free() # Replace with function body.
