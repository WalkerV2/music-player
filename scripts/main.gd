extends Control

var music_dir = OS.get_system_dir(OS.SYSTEM_DIR_MUSIC)
# must find files in music_dir


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dir_contents(music_dir)
	
	pass # Replace with function body.

# for directories in music_dir. get they songs, cuz them directories is artists.


func dir_contents(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print(DirAccess.get_files_at(music_dir.path_join("ADO Instrumentals")))
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
