extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("U smell")

var music_dir = OS.get_system_dir(OS.SYSTEM_DIR_MUSIC)

# must find files in music_dir



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
