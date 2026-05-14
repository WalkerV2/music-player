extends Control

@onready var file_dialog: FileDialog = $FileDialog

var music_dir: String = OS.get_system_dir(OS.SYSTEM_DIR_MUSIC)
var ado_dir: String  = music_dir.path_join("ADO")
# get_files at returns a PackedStringArray. NOT A STRING. 
# I'm not respecting the Correct type & 
var ado_song: PackedStringArray = DirAccess.get_files_at(ado_dir)
var ado_song_path = ado_dir.path_join(str(ado_song))
var song = ado_dir.path_join(ado_song[0])



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#load_mp3(song)
	dir_contents(music_dir)

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

func prepare_paths():
	
	pass

func dir_contents(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")


func _on_file_dialog_button_pressed() -> void:
	pass # Replace with function body.

func _on_audio_stream_player_ready() -> void:
	pass # Replace with function body.
