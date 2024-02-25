extends Button

## play button
func _on_pressed():
	get_tree().change_scene_to_file("res://isometric_test.tscn")

## quit button
func _on_quit_pressed():
	get_tree().quit()

## settings button
func _on_settings_pressed():
	pass # Replace with function body.
## idk something will happen, will figure out later
