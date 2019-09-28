extends TileMap

enum { EMPTY = -1, PLAYER, SHELF}

func _ready():
	for child in get_children():
		set_cellv(world_to_map(child.position), child.type)

func request_move(pawn, direction):
	var cell_start = world_to_map(pawn.position)
	var cell_target = cell_start + direction
	if get_cellv(cell_target) == EMPTY:
		return update_pawn_position(pawn, cell_start, cell_target)

func request_item():
	pass
	

func update_pawn_position(pawn, cell_start, cell_target):
	set_cellv(cell_target, pawn.type)
	set_cellv(cell_start, EMPTY)
	return map_to_world(cell_target) + cell_size / 2