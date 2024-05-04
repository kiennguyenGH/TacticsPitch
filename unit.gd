extends Node2D

@onready var tile_map : TileMap = $"../Isometric Tilemap"

var index: int = 0
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
			
			if data and !is_occupied(Vector2(pos2.x, pos2.y)):
				
				var id_path = astar_grid.get_id_path(tile_map.local_to_map(units[index].position), tile_mouse_pos).slice(1)
				print(id_path)
				#units[index].position = Vector2(pos2.x, pos2.y)
				if !id_path.is_empty():
					current_id_path = id_path
					
					
				units[index].unfocus()
				#if index == units.size()-1:
					#index = 0
				#else:
					#index += 1
				units[index].focus()
			#print(units.size())
			#print(index)
			
			
func is_occupied(tile_position):
	for i in units:
		if i.position == tile_position:
			return true
	return false

func _physics_process(delta):
	if current_id_path.is_empty():
		return
	var target_position = tile_map.map_to_local(current_id_path.front())
	if units[index].position.x < target_position.x and units[index].position.y < target_position.y:
		units[index].set_animation("DownRight")
	elif units[index].position.x > target_position.x and units[index].position.y > target_position.y:
		units[index].set_animation("UpLeft")
	elif units[index].position.x > target_position.x and units[index].position.y < target_position.y:
		units[index].set_animation("DownLeft")
	else:
		units[index].set_animation("UpRight")
	units[index].position = units[index].position.move_toward(target_position, 2)
	
	if units[index].position == target_position:
		current_id_path.pop_front()
	
