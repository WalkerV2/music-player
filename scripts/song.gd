extends Control

@onready var artist_name: RichTextLabel = $PanelContainer/HBoxContainer/ArtistName
@onready var song_title: Label = $PanelContainer/HBoxContainer/SongTitle
@onready var song_image: ColorRect = $PanelContainer/HBoxContainer/SongImage

var artist = "Bob Ross"
var song = "Lullaby"
# each song.tscn should show Title, Artist ,Album, Duration

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	artist_name.text = str("[url=" + artist + "]" + artist + "[/url]")
	song_title.text = str(song)
	pass # Replace with function body.





func _on_rich_text_label_meta_clicked(meta: Variant) -> void:
	print(str(meta) + " CLICKED")
	pass # Replace with function body.
