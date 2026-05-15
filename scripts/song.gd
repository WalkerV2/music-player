extends Control

# each song.tscn should show Title, Artist ,Album, Duration





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.





func _on_rich_text_label_meta_clicked(meta: Variant) -> void:
	print(str(meta) + "Hyper Link CLICKED!!!!!!")
	pass # Replace with function body.
