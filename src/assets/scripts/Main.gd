extends Node2D

var dandelion = preload("res://src/characters/Unicorn.tscn") # Preloads Dandy
var dandyPOS = Vector2(200,320) # Sets Dandys spawn vector

onready var musicTimer: Timer = get_node("musicTimer")
onready var anim_player: AnimationPlayer = get_node("MusicPlayer")
var musicTrack = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_player.play("startMusic")
	var dandy = dandelion.instance() # Set Dandy scene instance
	dandy.position = dandyPOS # Set Dandy spawn position
	add_child(dandy) # Adds Dandy as child node


func _on_musicTimer_timeout() -> void:
	if musicTrack == 0:
		anim_player.stop(true)
		anim_player.play("midMusic")
		musicTrack += 1
	elif musicTrack == 1:
		anim_player.stop(true)
		anim_player.play("endMusic")
		musicTrack += 1
		musicTimer.stop()
	else:
		pass
