extends TileMap

enum { EMPTY = -1, Player, SHELF, BELT, BUCKET}

func _ready():
	for child in get_children():
		print(child.name)
		if child.get("type"):
			print(child.type)
			add_to_grid(child.position, child.type)

func request_move(pawn, direction):
	var cell_start = world_to_map(pawn.position)
	var cell_target = cell_start + direction
	var cell_start_value = get_cellv(cell_start)
	print(cell_start_value)
	print(get_cellv(cell_target))
	match cell_start_value:
		1: # Player
			if get_cellv(cell_target) == EMPTY:
				return update_pawn_position(pawn, cell_start, cell_target)
		4: # bucket
			if get_cellv(cell_target) == 3:
				return update_pawn_position(pawn, cell_start, cell_target)

func request_item():
	pass
	

func update_pawn_position(pawn, cell_start, cell_target):
	set_cellv(cell_target, pawn.type)
	set_cellv(cell_start, EMPTY)
	return map_to_world(cell_target) + cell_size / 2
	
func add_to_grid(position,type):
	print("Adding " + str(type))
	set_cellv(world_to_map(position), type)