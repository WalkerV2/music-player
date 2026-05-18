extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var path = "C:/Users/WalkerV2/Music/ADO/Instrumental/ケルゲレンボルテックス -01- ケルゲレンボルテックス.mp3"
	if FileAccess.file_exists(path):
		var song : AudioStreamMP3 = load_mp3(path)
		stream = song
		play()


func load_mp3(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var sound = AudioStreamMP3.new()
	sound.data = file.get_buffer(file.get_length())
	return sound
