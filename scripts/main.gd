extends Control

@onready var file_dialog: FileDialog = $FileDialog
var audio = preload("res://scenes/audio_player.tscn").instantiate()
var CONFIG_PATH = "user://music-player.cfg"
var music_dir: String = OS.get_system_dir(OS.SYSTEM_DIR_MUSIC)
var config = ConfigFile.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(audio)
	pass

func add_artist(artist_path: String, artist_name: String):
	var artist = DirAccess.get_directories_at(artist_path)
	for albums in artist:
		var full_path = artist_path.path_join(albums)
		var artist_section = str(artist_name + "." + albums)
		config.set_value(artist_section, albums, full_path)
		var album = DirAccess.get_files_at(full_path)
		for songs in album:
			var song_name = songs.get_basename()
			config.set_value(artist_section,song_name, full_path.path_join(song_name))
	# current plan is have 1 mega cfg. 
	config.save(CONFIG_PATH)
	pass

func dir_contents(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				var artist_path = path.path_join(file_name)
				add_artist(artist_path, file_name)
			else:
				print("Found file: " + file_name)
			file_name = dir.get_next()
			print(file_name)
	else:
		print("An error occurred when trying to access the path.")


func _on_file_dialog_button_pressed() -> void:
	dir_contents(music_dir)
