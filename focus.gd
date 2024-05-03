extends Node2D

@onready var _focus = $Focus
# Called when the node enters the scene tree for the first time.
func focus():
	_focus.show()

func unfocus():
	_focus.hide()
