class_name unit
extends Node2D

@onready var _focus = $Focus

var health: int
var speed: int
var atk: int
var label: String

static func new_unit(name: String, speed:= randi_range(1,10), health:= 10, atk:= 1) -> unit:
	var new_unit: unit = load("res://unit.tscn").instantiate()
	new_unit.health = health
	new_unit.atk = atk
	new_unit.speed = speed
	new_unit.label = name
	return new_unit
# Called when the node enters the scene tree for the first time.

func focus():
	_focus.show()

func unfocus():
	_focus.hide()
