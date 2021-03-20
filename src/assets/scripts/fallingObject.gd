extends RigidBody2D

var move = Vector2(-1.5, 5) # Sets object movement vector

# Moves object every frame
func _physics_process(_delta: float) -> void:
	apply_central_impulse(move)

# Deletes object on collision
func _on_body_entered(_body: Node) -> void:
	# print(body.name)
	queue_free()
