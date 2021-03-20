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

onready var spawnPos = get_node("Position2D").position # Gets spawn position

func spawnjack() -> void:
	var jackSpawn = jack.instance() # Set jack scene instance
	jackSpawn.position = spawnPos # Set jack spawn position
	add_child(jackSpawn) # Add spawned jack as child node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnjack() # Calls Jack Spawn fuction

