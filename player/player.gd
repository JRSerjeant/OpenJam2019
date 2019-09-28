extends cell_type

onready var Grid = get_parent()
onready var pickup_sprite = $Pikcup_Sprite

func _ready():
	update_look_direction(Vector2(1, 0))

func _process(delta):
	check_pickup()
	var input_direction = get_input_direction()
	if not input_direction:
		return
	update_look_direction(input_direction)

	var target_position = Grid.request_move(self, input_direction)
	if target_position:
		print("Move to Target")
		move_to(target_position)
	else:
		bump()

func check_pickup():
	if Input.is_action_just_pressed("ui_select"):
		set_process(false)
		if $Pivot/Sprite/RayCast2D.is_colliding():
			print("player position = " + str(get_global_position()))
			$Pivot/Sprite/RayCast2D.get_collider().take_pickup(self)

			

func update_look_direction(direction):
	$Pivot/Sprite.rotation = direction.angle()
	
func get_input_direction():
	return Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	)

func bump():
	print("bump")
	
func move_to(target_position):
	set_process(false)
	$AnimationPlayer.play("walk")
	var move_direction = (target_position - position).normalized()
	$Tween.interpolate_property($".", "position", position, target_position, $AnimationPlayer.current_animation_length, Tween.TRANS_LINEAR, Tween.EASE_IN)
	
	#position = target_position
	$Tween.start()
	
	# Stop the function execution until the animation finished
	yield($AnimationPlayer, "animation_finished")
	position = target_position
	set_process(true)