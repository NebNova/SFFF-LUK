extends KinematicBody2D

export (int) var speed = 330 # Speed variable
var velocity = Vector2() # Velocity variable

# function to set character movement
func _physics_process(_delta): 
	velocity = Vector2(-speed, 0) # Set veloctiy
	velocity = move_and_slide(velocity) # Set movment direction

# Removes character upon hitting desired Area2D
func _on_Area2D_area_entered(area: Area2D) -> void:
#	print(area.name) # Debug Code to tell what object is reported
	if area.name == "Despawn": # Checks the name of the area hit for the despawn area
		queue_free() # Removes character from scene
