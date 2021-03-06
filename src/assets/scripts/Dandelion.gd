extends KinematicBody2D

export (int) var speed = 500 # Sets generic speed

var velocity = Vector2() # Velocity variable

onready var anim_player: AnimationPlayer = get_node("Unicorn_Flying_2s/AnimationPlayer")

# Gets input and moves "Dandy" accordingly
func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)

# Player character "Dandy" movment
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
	velocity = velocity.normalized() * speed # sets velocity of "Dandy" according to input

# Detects player collisions
func _on_UnicornArea_area_entered(area: Area2D) -> void:
#	print(area.name) # Debug Code
	if area.name == "Candy":
		pass
	else: # runs death code on anything but candy
		die()

# Playes death animation and adds death to death counter
func die() -> void:
	PlayerData.deaths += 1
	anim_player.play("Death")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://src/Main Scenes/EndScreen.tscn")
