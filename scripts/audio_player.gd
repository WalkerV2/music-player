extends AudioStreamPlayer


func load_song(path: String):
	if FileAccess.file_exists(path):
		var song : AudioStreamMP3 = load_mp3(path)
		stream = song
		play()

func load_mp3(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var sound = AudioStreamMP3.new()
	sound.data = file.get_buffer(file.get_length())
	return sound
