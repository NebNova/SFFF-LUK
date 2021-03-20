extends Node2D

var dandelion = preload("res://src/characters/Unicorn.tscn")
var dandyPOS = Vector2(200,320)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dandy = dandelion.instance() # Set object scene instance
	dandy.position = dandyPOS # Set object spawn position
	add_child(dandy) # Replace with function body.


