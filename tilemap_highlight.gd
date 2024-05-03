extends Node2D

@onready var tile_map : TileMap = $"../Isometric Tilemap"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var tile_mouse_pos = tile_map.local_to_map(mouse_pos)
	var data = tile_map.get_cell_tile_data(0, tile_mouse_pos)
	var used_tiles = tile_map.get_used_cells(0)
	
	for i in used_tiles:
		if tile_map.get_cell_tile_data(1, i):
			tile_map.erase_cell(1, i)
		
	if (data):
		tile_map.set_cell(1, tile_mouse_pos, 0, Vector2i(7, 0), 0)
	
	
