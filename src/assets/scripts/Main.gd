extends Node2D

var dandelion = preload("res://src/characters/Unicorn.tscn") # Preloads Dandy
var dandyPOS = Vector2(200,320) # Sets Dandys spawn vector

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dandy = dandelion.instance() # Set Dandy scene instance
	dandy.position = dandyPOS # Set Dandy spawn position
	add_child(dandy) # Adds Dandy as child node
