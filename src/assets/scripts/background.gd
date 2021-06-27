extends Sprite
const VELOCITY: float = -10.0 # Sets background velocity
var g_texture_width: float = 0 # Sets background width

# Sets texture width on ready
func _ready() -> void:
	g_texture_width = texture.get_size().x * scale.x 

# Reposiions backgrounds for scrolling animation
func _process(_delta: float) -> void:
	position.x += VELOCITY
	_attempt_reposition()

# Sets position of background texture
func _attempt_reposition() -> void:
	if position.x < -g_texture_width:
		# Don't just reset position texture width, otherwise there will be a gap
		position.x += 4 * g_texture_width
