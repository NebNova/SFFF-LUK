extends KinematicBody2D

export (int) var speed = 500 # Sets generic speed

var velocity = Vector2() # Velocity variable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Gets input and moves Dandy accordingly
func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)

# Dandy movment
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed


func _on_UnicornArea_area_entered(area: Area2D) -> void:
	print(area.name)
	die()

func die() -> void:
	PlayerData.deaths += 1
	queue_free()
	get_tree().change_scene("res://src/Main Scenes/EndScreen.tscn")
