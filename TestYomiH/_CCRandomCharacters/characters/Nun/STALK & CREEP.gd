extends CharacterState

func _frame_3():

	host.colliding_with_opponent = false
	host.apply_force(fixed.div(str(data.x), "10"), "0")

func _frame_15():
	host.reset_momentum()

func _tick():
	if current_tick % 2 == 0:
		host.create_speed_after_image_from_style(1)
