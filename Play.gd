extends Button

## play button
func _on_pressed():
	get_tree().change_scene_to_file("res://leveltest.tscn")


## quit button
func _on_quit_pressed():
	get_tree().quit()

## settings button
func _on_settings_pressed():
	pass # Replace with function body.
## idk something will happen, will figure out later

##test
func _on_character_ui_test_pressed():
	get_tree().change_scene_to_file("res://UiTest.tscn")
