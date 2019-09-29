extends Node2D

var sprites = [load("res://PikcUps/melon_atlastexture.tres"),
				load("res://PikcUps/apple_atlastexture.tres"),
				load("res://PikcUps/potatoes_atlastexture.tres"),
				load("res://PikcUps/milk_atlastexture.tres")]
export var sprite = 0

onready var Grid = get_parent()
export(PackedScene) var bucket
export var max_bucket_count = 1
var buckets = []
var bucket_instance

func _process(delta):
	if buckets.size() < max_bucket_count:
		create_bucket()
		

func create_bucket():
	print("Adding bucket")
	bucket_instance = bucket.instance()
	bucket_instance.position = position
	Grid.add_child(bucket_instance)
	buckets.append(bucket_instance)
	Grid.add_to_grid(bucket_instance.position, bucket_instance.type)