extends Area2D
signal picked_up

onready var pickup = get_owner().get_node("pickup")

func take_pickup(player):
	$AnimationPlayer.play("pickup_animation")
	$Tween.interpolate_property(pickup, "position", null, to_local(player.position), $AnimationPlayer.current_animation_length, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	yield($AnimationPlayer, "animation_finished")
	player.set_process(true)
	pickup.position = Vector2(0,0)
	pickup.scale = Vector2(0,0)
	$Tween.interpolate_property(pickup, "scale", null, Vector2(3.5,3.5), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
	player.pickup_sprite.texture = pickup.texture