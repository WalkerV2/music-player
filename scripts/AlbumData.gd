extends Resource
class_name AlbumData

@export var custom_title: String = ""
@export var title: String
@export var folder: String
# expects an image with the same name as the artist INSIDE the album folder.
# so path/to/artist/album/album.png
# it should always = path/to/folder + folder + ".png"
@export var image: String
@export var songs: Array[SongData]
