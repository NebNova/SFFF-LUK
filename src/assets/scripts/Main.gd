extends Node2D

var dandelion = preload("res://src/characters/Unicorn.tscn") # Preloads Dandy
var dandyPOS = Vector2(200,320) # Sets Dandys spawn vector

onready var musicTimer: Timer = get_node("musicTimer")
onready var startM: AudioStreamPlayer = get_node("StartMusic")
onready var midM: AudioStreamPlayer = get_node("MiddleMusic")
onready var endM: AudioStreamPlayer = get_node("EndMusic")
var musicTrack = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startM.play()
	var dandy = dandelion.instance() # Set Dandy scene instance
	dandy.position = dandyPOS # Set Dandy spawn position
	add_child(dandy) # Adds Dandy as child node


func _on_musicTimer_timeout() -> void:
	if musicTrack == 0:
		startM.stop()
		midM.play()
		musicTrack += 1
	elif musicTrack == 1:
		midM.stop()
		endM.play()
		musicTrack += 1
		musicTimer.stop()
	else:
		pass
