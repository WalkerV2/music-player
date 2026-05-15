extends Control

@onready var file_dialog: FileDialog = $FileDialog

var music_dir: String = OS.get_system_dir(OS.SYSTEM_DIR_MUSIC)
var ado_dir: String  = music_dir.path_join("ADO")
var config = ConfigFile.new()
# get_files at returns a PackedStringArray. NOT A STRING. 
# I'm not respecting the Correct type & stuff
var ado_song: PackedStringArray = DirAccess.get_files_at(ado_dir)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#load_mp3(song)
	pass

func add_artist(artist_path: String, artist_name: String):
	var songs = DirAccess.get_files_at(artist_path)
	for file in songs:
		var full_path = artist_path.path_join(file)
		# strips the file extension off the song file
		var song_name = file.get_basename()
		# Creates a per artist "Section"
		# creates KV pairs as song name = key. FULL System path = value
		config.set_value(artist_name, song_name, full_path)
		print(file.get_basename())
	# current plan is have 1 mega cfg. 
	config.save("user://music-player.cfg")
	pass


# this should be safe to run at any time, so we aren't regenerating the scenes every boot.
# for directories in music_dir. get they songs, cuz them directories is artists.
# for Artists in music_dir:
# 	Generate Artists.tscn.instantiate()
# 	for [Albums,Covers,Singles] in Artists
#		Generate albums.tscn.instantiate()
#		Generate covers.tscn.instantiate()
#		Generate singles.tscn.instantiate()
#		for songs in albums
#			Generate songs.tscn.isntantiate()
#		for songs in covers
#			generate songs.tscn.instantiate()
#		for songs in singles
#			generate songs.tscn.instantiate()
func load_mp3(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var sound = AudioStreamMP3.new()
	sound.data = file.get_buffer(file.get_length())
	return sound

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
	pass # Replace with function body.
