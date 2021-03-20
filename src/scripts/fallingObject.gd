extends RigidBody2D

var move = Vector2(-1.5, 5)

func _physics_process(delta: float) -> void:
	apply_central_impulse(move)

func _on_body_entered(body: Node) -> void:
	print(body.name)
	queue_free() # Replace with function body.
