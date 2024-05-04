extends Node2D

@onready var tile_map : TileMap = $"../Isometric Tilemap"

var index: int = 0
var units: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	#units = get_children()
	for i in 3:
		var unit_i = unit.new_unit("Unit"+str(i+1))
		unit_i._focus = $Unit/Focus
		units.append(unit_i)
		var positioned = false
		while !positioned:
			var rand_pos = tile_map.map_to_local(Vector2i(randi_range(1,12),randi_range(-9,1)))
			print(rand_pos)
			if !is_occupied(rand_pos):
				units[i].position = rand_pos
				print(units[i].position)
				positioned = true
	for n in units.size():
		for m in range(n+1, units.size()):
			if units[n].speed < units[m].speed:
				var temp = units[n]
				units[n] = units[m]
				units[m] = temp
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
			print(pos2)
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
