extends Node2D

var jack = preload("res://src/characters/Jack.tscn") # Preload jack scene
var sock = preload("res://src/characters/SockPuppet.tscn") # Preload sock scene
var goldF = preload("res://src/characters/Goldfish.tscn") # Preload goldfish scene
var dustB = preload("res://src/characters/DustBunny.tscn") # Preload dustbunny scene
var domino = preload("res://src/characters/Domino.tscn") # Preload domino scene
var candy = preload("res://src/characters/Candy.tscn") # Preload candy scene
var health = preload("res://src/characters/HealthUp.tscn") # Preload health scene
var dino = preload("res://src/characters/Dino.tscn") # Preaload Dino Scene


var difficultyIncrease = false # Initially sets difficullty increase to false
var spawns = 0 # Spawn variable
var FOTime = 2.0 # Falling object time
var attackTime = 10.0 # Attack character timer
var diffHC = 0 # Difficulty variable

var rng = RandomNumberGenerator.new() # New RNG

onready var CandyPos = get_node("candy").position # Gets candy Node
var CandySpawnPos = Vector2() # Candy Position variable
onready var FOPos = get_node("FallingObject").position # Gets spawn position for falling objects
var FOspawnPos = Vector2() # Falling object position variable
onready var sockPos = get_node("Sock").position # Gets Sock puppet node
onready var dustPos = get_node("dust").position # Gets Dust bunny node
onready var dinoPos = get_node("dino").position # Gets Dino node
onready var goldPos = get_node("gold").position # Gets Goldfish node

# Sets random spawn position for falling object
func randomFOPos() -> void:
	FOspawnPos = FOPos
	randomize()
	FOspawnPos.x = (randi() % 900 + FOPos.x)

# Sets random spawn position for candy
func randomCandyPos() -> void:
	CandySpawnPos = CandyPos
	randomize()
	CandySpawnPos.x = (randi() % 850 + CandyPos.x)
	CandySpawnPos.y = (randi() % 450 + CandyPos.y)

# Spawns random falling object
func spawnFallingObject() -> void:
	randomFOPos()
	randomize() # Randomize RNG
	var fallingObjects = [jack, domino] # Set Objects as part of array
	var fallingObject = fallingObjects[randi() % fallingObjects.size()] # Chose random object from array
	var FOSpawn = fallingObject.instance() # Set object scene instance
	FOSpawn.position = FOspawnPos # Set object spawn position
	add_child(FOSpawn) # Add spawned object as child node

# Sequentially spawns attackers until difficulty increase, then randomizes spawns
func spawnAttacker() -> void:
	if spawns == 0:
		var sockSpawn = sock.instance()
		sockSpawn.position = sockPos
		add_child(sockSpawn)
		spawns += 1
	elif spawns == 1:
		var dustSpawn = dustB.instance()
		dustSpawn.position = dustPos
		add_child(dustSpawn)
		spawns += 1
	elif spawns == 2:
		var dinoSpawn = dino.instance()
		dinoSpawn.position = dinoPos
		add_child(dinoSpawn)
		spawns += 1
	elif spawns == 3:
		var goldSpawn = goldF.instance()
		goldSpawn.position = goldPos
		add_child(goldSpawn)
		spawns +=1
	else:
		increaseDifficultyStart()
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

# Strats difficulty increase timer
func increaseDifficultyStart() -> void:
	if not difficultyIncrease:
		difficultyIncrease = true
		get_node("increaseDifficultyTimer").start(20.0)
	else:
		pass

# Spawns attacker on timeout
func _on_attackTimer_timeout() -> void:
	spawnAttacker()

# Spawns Falling object on timout
func _on_FOTimer_timeout() -> void:
	spawnFallingObject()

# Increase difficulty variable
func _on_increaseDifficultyTimer_timeout() -> void:
	if diffHC <= 14:
#		print(diffHC) # Debug Code
		diffHC += 1
		FOTime -= 0.1
#		print(FOTime) # Debug Code
		attackTime -= 0.7
#		print(attackTime) # Debug Code
		get_node("FOTimer").start(FOTime)
		get_node("attackTimer").start(attackTime)
	else:
		pass

# Spawns randy at random position on timeout
func _on_CandyTimer_timeout() -> void:
	randomCandyPos()
	var CandySpawn = candy.instance() # Set candy scene instance
	CandySpawn.position = CandySpawnPos # Set candy spawn position
	add_child(CandySpawn)
