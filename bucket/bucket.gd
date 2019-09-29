extends cell_type

onready var Grid = get_parent()
var move_direction = Vector2(1,0)

func _process(delta):
	var target_position = Grid.request_move(self, move_direction)
	if target_position:
		print("bucket: Move to Target")
		move_to(target_position)
		
		
func move_to(target_position):
	set_process(false)
	#$AnimationPlayer.play("walk")
	#var move_direction = (target_position - position).normalized()
	$Tween.interpolate_property($".", "position", position, target_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	yield($Tween, "tween_completed")
	position = target_position
	set_process(true)