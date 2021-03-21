extends RigidBody2D

var move = Vector2(-1.5, 5) # Sets object movement vector

func _physics_process(_delta: float) -> void:
	apply_central_impulse(move)


func _on_Area2D_area_entered(area: Area2D) -> void:
	print(area.name)
	queue_free()

func _on_body_entered(body: Node) -> void:
	print(body.name)
	queue_free() # Replace with function body.
