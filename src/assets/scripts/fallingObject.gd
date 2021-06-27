extends RigidBody2D

var move = Vector2(-1.5, 5) # Sets object movement vector

# Applies force to falling objects
func _physics_process(_delta: float) -> void:
	apply_central_impulse(move)

# Despawns on contact with Area2D
func _on_Area2D_area_entered(area: Area2D) -> void:
#	print(area.name) # Debug Code
	queue_free()

# Despawns on physics body enter
func _on_body_entered(body: Node) -> void:
#	print(body.name) # Debug Code
	queue_free()
