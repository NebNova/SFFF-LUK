extends RigidBody2D

var move = Vector2(-350, -2500)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_central_impulse(move)


func _on_collision(body: Node) -> void:
	print("hit")
	queue_free()# Replace with function body.
