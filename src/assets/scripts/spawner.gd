extends Node2D

var jack = preload("res://src/characters/Jack.tscn") # Preload jack scene
var sock = preload("res://src/characters/SockPuppet.tscn") # Preload sock scene
var goldF = preload("res://src/characters/Goldfish.tscn") # Preload goldfish scene
var dustB = preload("res://src/characters/DustBunny.tscn") # Preload dustbunny scene
var domino = preload("res://src/characters/Domino.tscn") # Preload domino scene
var coin = preload("res://src/characters/Coin.tscn") # Preload coin scene
var health = preload("res://src/characters/HealthUp.tscn") # Preload health scene
var dino = preload("res://src/characters/Dino.tscn")
# var barbie = preload("")

var rng = RandomNumberGenerator.new() # New RNG

onready var FOspawnPos = get_node("FallingObject").position # Gets spawn position for falling objects
onready var sockPos = get_node("Sock").position
onready var dustPos = get_node("dust").position
onready var dinoPos = get_node("dino").position

func _ready() -> void:
	yield(get_tree().create_timer(5.0), "timeout")
	spawnSock() # Calls Sock spawn fucntion
	yield(get_tree().create_timer(5.0), "timeout")
	spawnDust()
	yield(get_tree().create_timer(5.0), "timeout")
	spawnSock() # Calls Sock spawn fucntion
	yield(get_tree().create_timer(5.0), "timeout")
	spawnDino()

func spawnFallingObject() -> void:
	randomize() # Randomize RNG
	var fallingObjects = [jack, domino] # Set Objects as part of array
	var fallingObject = fallingObjects[randi() % fallingObjects.size()] # Chose random object from array
	var FOSpawn = fallingObject.instance() # Set object scene instance
	FOSpawn.position = FOspawnPos # Set object spawn position
	add_child(FOSpawn) # Add spawned object as child node

func spawnSock() -> void:
	var sockSpawn = sock.instance()
	sockSpawn.position = sockPos
	add_child(sockSpawn)

func spawnDust() -> void:
	var dustSpawn = dustB.instance()
	dustSpawn.position = dustPos
	add_child(dustSpawn)

func spawnDino() -> void:
	var dinoSpawn = dino.instance()
	dinoSpawn.position = dinoPos
	add_child(dinoSpawn)

func _on_Timer_timeout() -> void:
	spawnFallingObject() # Calls object spawn on timer timout
