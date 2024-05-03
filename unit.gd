extends Node2D

@onready var tile_map : TileMap = $"../Isometric Tilemap"

var index: int = 0
var units: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	units = get_children()
	#print(units[0])
	#print(units[0].get_children())
	units[0].focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
		if Input.is_action_just_released("click"):
			var mouse_pos = get_global_mouse_position()
			
			var tile_mouse_pos = tile_map.local_to_map(mouse_pos)
			var data = tile_map.get_cell_tile_data(0, tile_mouse_pos)
			var pos2 = tile_map.map_to_local(tile_mouse_pos)
			#print(mouse_pos)
			#print(tile_mouse_pos)
			#print(pos2)
			print(tile_map.get_surrounding_cells(tile_mouse_pos))
			if (data) and !is_occupied(Vector2(pos2.x, pos2.y)):
				units[index].position = Vector2(pos2.x, pos2.y)
				units[index].unfocus()
				
				if index == units.size()-1:
					index = 0
				else:
					index += 1
			
			#print(units.size())
			#print(index)
			units[index].focus()
			
func is_occupied(tile_position):
	for i in units:
		if i.position == tile_position:
			return true
	return false
