extends Node2D

@onready var tile_map : TileMap = $"../Isometric Tilemap"

var index: int = 0
var current_index: int = 0
var units: Array = []
var astar_grid : AStarGrid2D
var current_id_path: Array[Vector2i]
var target_position: Vector2
var is_moving = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	astar_grid = AStarGrid2D.new()
	astar_grid.region = tile_map.get_used_rect()
	astar_grid.cell_size = Vector2(32,16)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar_grid.update()
	
	for i in tile_map.get_used_cells(0):
		if !tile_map.get_cell_tile_data(0, i).get_custom_data("walkable"):
			astar_grid.set_point_solid(i)
			
	units = get_children()
	
	for i in units:
		i.position = tile_map.map_to_local(tile_map.local_to_map(i.position))
		
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
			#print(tile_map.get_surrounding_cells(tile_mouse_pos))
			
			if data and !is_occupied(Vector2(pos2.x, pos2.y)) and !is_moving and tile_map.get_cell_tile_data(0, tile_mouse_pos).get_custom_data("walkable"):
				
				var id_path = astar_grid.get_id_path(tile_map.local_to_map(units[index].position), tile_mouse_pos).slice(1)
				print(id_path)
				#units[index].position = Vector2(pos2.x, pos2.y)
				if !id_path.is_empty():
					current_id_path = id_path
					
					
				units[index].unfocus()
				is_moving = true
				current_index = index
				if index == units.size()-1:
					index = 0
				else:
					index += 1
				
			#print(units.size())
			#print(index)
			
			
func is_occupied(tile_position):
	for i in units:
		if i.position == tile_position:
			return true
	return false

func _physics_process(delta):
	if current_id_path.is_empty():
		is_moving = false
		refresh_grid()
		units[index].focus()
		return
	var target_position = tile_map.map_to_local(current_id_path.front())
	if units[current_index].position.x < target_position.x and units[current_index].position.y < target_position.y:
		units[current_index].set_animation("DownRight")
	elif units[current_index].position.x > target_position.x and units[current_index].position.y > target_position.y:
		units[current_index].set_animation("UpLeft")
	elif units[current_index].position.x > target_position.x and units[current_index].position.y < target_position.y:
		units[current_index].set_animation("DownLeft")
	else:
		units[current_index].set_animation("UpRight")
	units[current_index].position = units[current_index].position.move_toward(target_position, 2)
	
	if units[current_index].position == target_position:
		current_id_path.pop_front()
	
func refresh_grid():
	for i in tile_map.get_used_cells(0):
		if is_occupied(tile_map.map_to_local(i)) or !tile_map.get_cell_tile_data(0, i).get_custom_data("walkable"):
			astar_grid.set_point_solid(i)
		else:
			astar_grid.set_point_solid(i, false)
