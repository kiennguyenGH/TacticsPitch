extends Node2D

@onready var tile_map : TileMap = $"../Isometric Tilemap"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
		if Input.is_action_just_released("click"):
			var mouse_pos = get_global_mouse_position()
			
			var tile_mouse_pos = tile_map.local_to_map(mouse_pos)
			print(mouse_pos)
			print(tile_mouse_pos)
			position = Vector2(mouse_pos.x, mouse_pos.y)
