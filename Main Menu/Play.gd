extends Button

## play button
func _on_pressed():
	get_tree().change_scene_to_file("res://isometric_test.tscn")


## quit button
func _on_quit_pressed():
	get_tree().quit()

## settings button
func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Main Menu/Options.tscn")

##test
func _on_character_ui_test_pressed():
	get_tree().change_scene_to_file("res://UiTest.tscn")


func _on_movement_test_pressed():
	get_tree().change_scene_to_file("res://isometric_test.tscn")


func _on_gallery_pressed():
	get_tree().change_scene_to_file("res://gallery.tscn")
