extends Resource
class_name ArtistData

@export var custom_title: String = ""
@export var title: String
@export var folder: String
# expects an image with the same name as the artist INSIDE the artist folder.
# so path/to/artist/Artist.png
# it should always = path/to/folder + folder + ".png"
@export var image: String
@export var albums: Array[AlbumData]
