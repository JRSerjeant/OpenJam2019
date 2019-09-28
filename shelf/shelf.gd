extends cell_type
tool

enum SELF_POINT_DIRECTIONS{ LEFT, RIGHT }
export(SELF_POINT_DIRECTIONS) var direction = SELF_POINT_DIRECTIONS.LEFT
var sprites = [load("res://PikcUps/melon_atlastexture.tres"),
				load("res://PikcUps/apple_atlastexture.tres"),
				load("res://PikcUps/potatoes_atlastexture.tres"),
				load("res://PikcUps/milk_atlastexture.tres")]
export var sprite = 0


func _process(delta):
	$pickup.set_texture(sprites[sprite])
	match direction:
		SELF_POINT_DIRECTIONS.LEFT:
			$shelf.rotation_degrees = 90
		SELF_POINT_DIRECTIONS.RIGHT:
			$shelf.rotation_degrees = -90



