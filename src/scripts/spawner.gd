extends Node2D

var jack = preload("res://src/characters/Jack.tscn") # Preload jack scene
var sock = preload("res://src/characters/SockPuppet.tscn") # Preload sock scene
var goldF = preload("res://src/characters/Goldfish.tscn") # Preload goldfish scene
var dustB = preload("res://src/characters/DustBunny.tscn") # Preload dustbunny scene
var domino = preload("res://src/characters/Domino.tscn") # Preload domino scene
var coin = preload("res://src/characters/Coin.tscn") # Preload coin scene
var health = preload("res://src/characters/HealthUp.tscn") # Preload health scene
# var dino = preload("")
# var barbie = preload("")

var rng = RandomNumberGenerator.new() # New RNG

onready var spawnPos = get_node("FallingObject").position # Gets spawn position

func spawnFallingObject() -> void:
	randomize() # Randomize RNG
	var fallingObjects = [jack, domino] # Set Objects as part of array
	var fallingObject = fallingObjects[randi() % fallingObjects.size()] # Chose random object from array
	var FOSpawn = fallingObject.instance() # Set object scene instance
	FOSpawn.position = spawnPos # Set object spawn position
	add_child(FOSpawn) # Add spawned object as child node


func _on_Timer_timeout() -> void:
	spawnFallingObject() # Calls object spawn on timer timout
