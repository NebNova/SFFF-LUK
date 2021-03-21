extends KinematicBody2D

export (int) var speed = 330 # Speed variable
var velocity = Vector2() # Velocity variable

func _ready() -> void:
	pass 

func _physics_process(_delta):
	velocity = Vector2(-speed, 0)
	velocity = move_and_slide(velocity)

func _on_Area2D_area_entered(area: Area2D) -> void:
	print(area.name)
	if area.name == "Despawn":
		queue_free()
