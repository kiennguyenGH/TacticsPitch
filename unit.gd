extends Node2D

@onready var tile_map : TileMap = $"../Isometric Tilemap"

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Unit Animation".stop()
	$"Unit Animation".frame = 1
	#get_node("turn_test").turn_started(unit).connect(_on_turn_test_turn_started(unit))
#func _input(event):	
#	if Input.is_action_just_released("click"):
#		var mouse_pos = get_global_mouse_position()
	
#		var tile_mouse_pos = tile_map.local_to_map(mouse_pos)
#		var pos2 = tile_map.map_to_local(tile_mouse_pos)
#		print(mouse_pos)
#		print(tile_mouse_pos)
#		print(pos2)
#		position = Vector2(pos2.x, pos2.y)

func _on_turn_test_turn_started(units):
	if units == self:
		$"Unit Animation".play()
	else:
		$"Unit Animation".stop()
		$"Unit Animation".frame = 1
