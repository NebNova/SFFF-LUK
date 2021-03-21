extends Node2D

var jack = preload("res://src/characters/Jack.tscn") # Preload jack scene
var sock = preload("res://src/characters/SockPuppet.tscn") # Preload sock scene
var goldF = preload("res://src/characters/Goldfish.tscn") # Preload goldfish scene
var dustB = preload("res://src/characters/DustBunny.tscn") # Preload dustbunny scene
var domino = preload("res://src/characters/Domino.tscn") # Preload domino scene
var coin = preload("res://src/characters/Coin.tscn") # Preload coin scene
var health = preload("res://src/characters/HealthUp.tscn") # Preload health scene
var dino = preload("res://src/characters/Dino.tscn")


var rng = RandomNumberGenerator.new() # New RNG

onready var FOPos = get_node("FallingObject").position # Gets spawn position for falling objects
var FOspawnPos = Vector2()
onready var sockPos = get_node("Sock").position
onready var dustPos = get_node("dust").position
onready var dinoPos = get_node("dino").position
onready var goldPos = get_node("gold").position


func randomFOPos() -> void:
	FOspawnPos = FOPos
	randomize()
	FOspawnPos.x = (randi() % 700 + FOPos.x)

func spawnFallingObject() -> void:
	randomFOPos()
	randomize() # Randomize RNG
	var fallingObjects = [jack, domino] # Set Objects as part of array
	var fallingObject = fallingObjects[randi() % fallingObjects.size()] # Chose random object from array
	var FOSpawn = fallingObject.instance() # Set object scene instance
	FOSpawn.position = FOspawnPos # Set object spawn position
	add_child(FOSpawn) # Add spawned object as child node

func spawnAttacker() -> void:
	randomize()
	var attackers = [sock, dustB, dino, goldF]
	var attacker = attackers[randi() % attackers.size()]
	if attacker == sock:
		var sockSpawn = sock.instance()
		sockSpawn.position = sockPos
		add_child(sockSpawn)
	elif attacker == dustB:
		var dustSpawn = dustB.instance()
		dustSpawn.position = dustPos
		add_child(dustSpawn)
	elif attacker == dino:
		var dinoSpawn = dino.instance()
		dinoSpawn.position = dinoPos
		add_child(dinoSpawn)
	elif attacker == goldF:
		var goldSpawn = goldF.instance()
		goldSpawn.position = goldPos
		add_child(goldSpawn)

func _on_attackTimer_timeout() -> void:
	spawnAttacker()

func _on_FOTimer_timeout() -> void:
	spawnFallingObject() # Replace with function body.
