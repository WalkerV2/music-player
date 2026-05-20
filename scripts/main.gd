extends Control

@onready var songs_list: RichTextLabel = $"THEORY CRAFTING/HBoxContainer/SongsDisplay/VBoxContainer/SongsList"
@onready var file_dialog: FileDialog = $FileDialog
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

var CONFIG_PATH = "user://music-player.cfg"
var music_dir: String = OS.get_system_dir(OS.SYSTEM_DIR_MUSIC)
var config = ConfigFile.new()


func _ready() -> void:
	var artist_dir = DirAccess.open("user://artists")
	if artist_dir:
		print("Folder found!!")
	else:
		DirAccess.make_dir_absolute("user://artists")


func build_library(path: String) -> void:
	for artist_folder in DirAccess.get_directories_at(path):
		var artist = ArtistData.new()
		var artist_path = music_dir.path_join(artist_folder)
		artist.title = artist_folder
		artist.folder = music_dir.path_join(artist_folder)
		#print(artist.folder)
		for album_folder in DirAccess.get_directories_at(artist_path):
			var album = AlbumData.new()
			var album_path = artist_path.path_join(album_folder)
			album.title = album_folder
			album.folder = artist_folder.path_join(album_folder)
			artist.albums.append(album)
			#print(album_folder)
			for song_file in DirAccess.get_files_at(album_path):
				var song = SongData.new()
				song.title = song_file.get_basename()
				song.file = album_path.path_join(song_file)
				album.songs.append(song)
				var extension = song_file.get_extension().to_lower()
				match extension:
					"mp3": song.audio_type = "mp3"
					"ogg": song.audio_type = "ogg"
					"wav": song.audio_type = "wav"
		ResourceSaver.save(artist, "user://artists/" + artist.title + ".tres",ResourceSaver.FLAG_NONE)


func _on_file_dialog_button_pressed() -> void:
	var bbcode = ""
	#build_library(music_dir)
	var artist = load("user://artists/ADO.tres")
	for album in artist.albums:
		for song in album.songs:
			#[url={"key": "value"}]Text[/url] everything after the = is the key.
			# ALL clickable metas connect to the same func.
			# like linking to the artists scene, the album scene. or whatever else you may want.
			bbcode += "[url=play" + song.file + "]" + song.title + "[/url]" + "\n"
		songs_list.text = bbcode


func _on_songs_list_meta_clicked(meta: Variant) -> void:
	audio.load_song(meta.trim_prefix("play"))
